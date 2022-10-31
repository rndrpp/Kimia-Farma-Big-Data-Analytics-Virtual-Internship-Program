CREATE TABLE barang (
    kode_barang varchar(10) PRIMARY KEY,
    sektor char(1),
    nama_barang varchar(50),
    tipe varchar(5),
    nama_tipe varchar(20),
    kode_lini int,
    lini varchar(20),
    kemasan varchar(10)
);

CREATE TABLE pelanggan (
    id_customer varchar(10) PRIMARY KEY,
    "level" varchar(10),
    nama varchar(255),
    id_cabang_sales varchar(10),
    cabang_sales varchar(50),
    id_group varchar(5),
    "group" varchar(10)
);

CREATE TABLE penjualan (
    id_distributor varchar(5),
    id_cabang varchar(10),
    id_invoice varchar(10) PRIMARY KEY,
    tanggal date,
    id_customer varchar(10),
    id_barang varchar(10),
    jumlah_barang int,
    unit varchar(10),
    harga decimal,
    mata_uang char(3),
    brand_id varchar(10),
    lini varchar(20)
);

ALTER TABLE penjualan ADD FOREIGN KEY (id_customer) 
REFERENCES pelanggan(id_customer);

ALTER TABLE penjualan ADD FOREIGN KEY (id_barang) 
REFERENCES barang(kode_barang);

COPY barang(kode_barang, sektor, nama_barang, tipe,
            nama_tipe, kode_lini, lini, kemasan)
FROM 'D:\Rakamin\VIX Kimia Farma\barang.csv'
DELIMITER ','
CSV HEADER;

COPY pelanggan(id_customer, "level", nama, id_cabang_sales, 
               cabang_sales, id_group, "group")
FROM 'D:\Rakamin\VIX Kimia Farma\pelanggan.csv'
DELIMITER ','
CSV HEADER;

COPY penjualan(id_distributor, id_cabang, id_invoice, 
               tanggal, id_customer, id_barang, jumlah_barang,
               unit, harga, mata_uang, brand_id, lini)
FROM 'D:\Rakamin\VIX Kimia Farma\penjualan.csv'
DELIMITER ','
CSV HEADER;