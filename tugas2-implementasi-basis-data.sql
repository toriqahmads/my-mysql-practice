CREATE DATABASE KURSUS_0028;

USE KURSUS_0028;

CREATE TABLE tpeserta_0028(nip VARCHAR(5), nama_peserta VARCHAR(15), kota_asal VARCHAR(10), PRIMARY KEY (nip));
CREATE TABLE tkursus_0028(kode_kursus VARCHAR(4), nama_kursus VARCHAR(19), biaya NUMERIC, PRIMARY KEY (kode_kursus));
CREATE TABLE tpendaftaran_0028(nip VARCHAR(5), kode_kursus VARCHAR(4), kelompok VARCHAR(2), tgl_mulai DATE, FOREIGN KEY (nip) REFERENCES tpeserta_0028(nip), FOREIGN KEY (kode_kursus) REFERENCES tkursus_0028 (kode_kursus));

LOAD DATA INFILE 'D:\implementasi_basis_data/TPeserta.txt' INTO TABLE tpeserta_0028
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'D:\implementasi_basis_data/TKursus.txt' INTO TABLE tkursus_0028
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'D:\implementasi_basis_data/TPendaftaran.txt' INTO TABLE tpendaftaran_0028
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT nip, nama_peserta
FROM tpeserta_0028
WHERE kota_asal != 'Semarang' AND kota_asal != 'Kudus';

SELECT kode_kursus, nama_kursus, biaya
FROM tkursus_0028
WHERE nama_kursus LIKE 'Pemrograman-%' OR nama_kursus LIKE 'Database-%' ORDER BY biaya ASC;

SELECT k.kode_kursus, k.nama_kursus
FROM tkursus_0028 k INNER JOIN tpendaftaran_0028 d ON k.kode_kursus = d.kode_kursus
WHERE DATEDIFF(d.tgl_mulai, NOW()) <= (SELECT DATEDIFF(d.tgl_mulai, NOW()) FROM tpendaftaran_0028 d ORDER BY d.tgl_mulai LIMIT 1);

SELECT p.nip, p.nama_peserta, k.nama_kursus, d.tgl_mulai
FROM tpeserta_0028 p INNER JOIN tpendaftaran_0028 d ON p.nip = d.nip INNER JOIN tkursus_0028 k ON k.kode_kursus = d.kode_kursus;

SELECT p.nip, p.nama_peserta
FROM tpeserta_0028 p INNER JOIN tpendaftaran_0028 d ON p.nip = d.nip
GROUP BY d.nip HAVING COUNT(*) = 1;

SELECT k.kode_kursus, k.nama_kursus, COUNT(d.nip) jumlah_peserta
FROM tkursus_0028 k INNER JOIN tpendaftaran_0028 d ON k.kode_kursus = d.kode_kursus
GROUP BY k.kode_kursus ORDER BY jumlah_peserta DESC;

SELECT k.kode_kursus, k.nama_kursus
FROM tkursus_0028 k LEFT JOIN tpendaftaran_0028 d ON k.kode_kursus = d.kode_kursus
WHERE d.nip IS NULL;

SELECT p.nip, p.nama_peserta, SUM(k.biaya) total_biaya
FROM tpeserta_0028 p INNER JOIN tpendaftaran_0028 d ON p.nip = d.nip INNER JOIN tkursus_0028 k ON k.kode_kursus = d.kode_kursus
GROUP BY p.nip;

SELECT p.nip, p.nama_peserta
FROM tpeserta_0028 p LEFT JOIN tpendaftaran_0028 d ON p.nip = d.nip
WHERE d.nip IS NULL;
