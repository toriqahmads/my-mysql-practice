CREATE DATABASE kepegawaian_0028;

USE kepegawaian_0028;

CREATE TABLE karyawan_0028 (nip int(5), nama_depan varchar(10), nama_belakang varchar(15), kelamin char(1), kota_asal varchar(10), tanggal_lahir date, jabatan varchar(25));

ALTER TABLE karyawan_0028 ADD PRIMARY KEY(nip);

ALTER TABLE karyawan_0028 CHANGE nip nip int(5) NOT NULL;

DESCRIBE karyawan_0028;

INSERT INTO karyawan_0028 VALUES 
('11111', 'Wawan', 'Setiawan', 'L', 'Jakarta', '1970-06-14', 'Manajer Marketing'),
('22222', 'Bucek', 'Haryadi', 'L', 'Semarang', '1972-09-24', 'Staf Marketing'),
('33333', 'Tuti', 'Trianti', 'P', 'Jakarta', '1970-01-27', 'Konsultan Lepas'),
('44444', 'Budi', 'Prakoso', 'L', 'Bogor', '1971-08-06', 'Manajer IT'),
('55555', 'Any', 'Rahmawati', 'P', 'Cirebon', '1973-12-17', 'Staf IT'),
('66666', 'Hasan', 'Utoyo', 'L', 'Semarang', '1976-11-13', 'Staf IT'),
('77777', 'Bobby', 'Lukito', 'L', 'Jakarta', '1969-08-11', 'Staf Sales'),
('88888', 'Ferry', 'Afandi', 'L', 'Solo', '1971-08-16', 'Staf Sales'),
('99999', 'Tuti', 'Safitri', 'P', 'Kudus', '1964-09-10','Kepala HRD'), 
('11112', 'Fifi', 'Romansa', 'P', 'Magelang', '1976-04-16', 'Staf HRD');

ALTER TABLE karyawan_0028 ADD column status_kota_asal varchar(15) after kota_asal;

ALTER TABLE karyawan_0028 ADD column status_pegawai varchar(25) after jabatan;

INSERT INTO karyawan_0028 (nip, nama_depan, nama_belakang, kelamin, kota_asal, tanggal_lahir) VALUES ('90001', 'Toriq', 'Ahmad Salam', 'L', 'Jepara', '1997-06-02');

INSERT INTO karyawan_0028 (nip, nama_depan, nama_belakang, kelamin, kota_asal, tanggal_lahir) VALUES ('90002', 'Dufita', 'Putri', 'P', 'Purbalingga', '1997-11-12');

SELECT * FROM karyawan_0028 WHERE nama_belakang LIKE '%to%';
