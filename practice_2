CREATE DATABASE LATIHAN_0028;
USE LATIHAN_0028;
CREATE TABLE PRODUK_0028 (nama_produk VARCHAR(10), bahan VARCHAR(10), jumlah INT(2), warna VARCHAR(15), tanggal_produksi date);
DESCRIBE PRODUK_0028;
INSERT INTO PRODUK_0028 VALUES
('Gelas', 'Kaca', '20', 'Bening', '2017-06-14'),
('Gelas', 'Plastik', '40', 'Merah', '2016-09-24'),
('Piring', 'Kaca', '15', 'Biru', '2017-01-27'),
('Sendok', 'Porselen', '60', 'Coklat', '2017-08-06'),
('Sendok', 'Plastik', '34', 'Hijau', '2016-12-17'),
('Mug', 'Porselen', '5', 'Putih', '2015-11-13'),
('Mug', 'Plastik', '33', 'Merah', '2011-08-11'),
('Mug', 'Kaca', '52', 'Bening', '2016-08-16'),
('Mangkok', 'Porselen', '29', 'Hijau', '2017-09-10'),
('Mangkok', 'Kaca', '10', 'Bening', '2017-04-16');
SELECT * FROM PRODUK_0028;
ALTER TABLE PRODUK_0028 ADD COLUMN status_persediaan VARCHAR(20);
SELECT * FROM PRODUK_0028 WHERE (bahan = 'Kaca' AND nama_produk LIKE '%ok%');
SELECT * FROM PRODUK_0028 WHERE (jumlah BETWEEN 30 AND 40 AND warna != 'bening');
SELECT * FROM PRODUK_0028 WHERE (bahan != 'Kaca' AND tanggal_produksi LIKE '%2016%') ORDER BY nama_produk;
UPDATE PRODUK_0028 SET status_persediaan = IF(jumlah>30, 'Tersedia Over', IF(jumlah<=30 AND jumlah>=10, 'Tersedia', 'Tersedia Limit'));
SELECT CONCAT(UPPER(nama_produk), ' - ',  LOWER(bahan), ', ', jumlah, ', ', tanggal_produksi, ', ', status_persediaan) FROM PRODUK_0028 WHERE bahan != 'Plastik';
