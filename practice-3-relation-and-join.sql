CREATE DATABASE akademik;
USE akademik;
CREATE TABLE mahasiswa(nim VARCHAR(5) NOT NULL, nama_mhs VARCHAR(30) NOT NULL, alamat_asal VARCHAR(20) NOT NULL, PRIMARY KEY (nim));
CREATE TABLE matkul(kode_mk VARCHAR(5) NOT NULL, nama_mk VARCHAR(50) NOT NULL, sks_mk NUMERIC(1) NOT NULL, PRIMARY KEY (kode_mk));
CREATE TABLE nilai(nim VARCHAR(5) NOT NULL, kode_mk VARCHAR(5) NOT NULL, kode_kelompok VARCHAR(2) NOT NULL, nilai_tengah INT(3), nilai_akhir INT(3));
INSERT INTO mahasiswa VALUES
('01/08', 'Arief Himawan', 'Demak'),
('02/09', 'Suhendar Adi W', 'Kudus'),
('03/10', 'Sarifah Amin', 'Semarang'),
('04/11', 'Joko Pitoyo', 'Semarang'),
('05/12', 'Burhanudin', 'Sumbawa');
INSERT INTO matkul VALUES
('CS630','Teori Komputasi',3),
('CS631','Sistem Operasi',3),
('CS632','Analisis Numerik',3),
('CS633','Analisis Algoritma',3),
('CS636','Perancangan System Berorientasi Objek',3),
('CS640','Model dan Sistem Informasi',2),
('CS641','Perancangan Perangkat Lunak',4),
('CS643','Sistem Manajemen Basis Data',3),
('CS645','Teknologi Informasi',2),
('CS646','Pemodelan dan Simulasi',4),
('CS647','Pemrosesan Data Statistik',3),
('CS660','Arsitektur dan Organisasi Komputer',3),
('CS661','Jaringan Komputer',2),
('CS663','Interoperabilitas',3),
('CS665','Grafika Interaktif dan Animasi',3);

INSERT INTO nilai VALUES
('01/08','CS630','A1',70,80),
('01/08','CS631','A1',50,40),
('01/08','CS632','A1',60,70),
('01/08','CS633','A1',60,60),
('02/09','CS632','A1',50,55),
('02/09','CS633','A1',80,90),
('03/10','CS630','A1',75,80),
('03/10','CS631','A1',40,35),
('03/10','CS632','A1',45,60),
('04/11','CS631','A1',50,45),
('04/11','CS632','A1',65,75),
('04/11','CS633','A1',70,50);

SELECT mhs.nama_mhs, mk.nama_mk, mk.sks_mk FROM mahasiswa AS mhs, matkul AS mk, nilai AS nl WHERE mhs.nim = nl.nim AND nl.kode_mk = mk.kode_mk;
SELECT mhs.nama_mhs, mk.nama_mk, nl.nilai_tengah, nl.nilai_akhir FROM mahasiswa AS mhs, matkul AS mk, nilai AS nl WHERE mhs.nim = nl.nim AND nl.kode_mk = mk.kode_mk AND mk.nama_mk = 'Analisis Algoritma' ORDER BY (nl.nilai_akhir + nl.nilai_tengah) DESC;
SELECT mhs.* FROM mahasiswa AS mhs WHERE mhs.nim NOT IN (SELECT nilai.nim FROM nilai);
SELECT mk.* FROM matkul AS mk WHERE mk.kode_mk NOT IN (SELECT nilai.kode_mk FROM nilai);
