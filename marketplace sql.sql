CREATE TABLE pelanggan (
    id_pelanggan     INTEGER NOT NULL,
    nama_pelanggan   VARCHAR2(50 BYTE) NOT NULL,
    email            VARCHAR2(50 BYTE) NOT NULL,
    no_telp          VARCHAR2(16 BYTE) NOT NULL,
    alamat           VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE pelanggan ADD CONSTRAINT pelanggan_pk PRIMARY KEY ( id_pelanggan );

CREATE TABLE pemesanan (
    id_pesanan               INTEGER NOT NULL,
    tgl_pesanan              DATE NOT NULL,
    status_pesanan           VARCHAR2(50 BYTE) NOT NULL,
    kuantitas_produk         INTEGER NOT NULL,
    total_harga              NUMBER NOT NULL,
    metode_pembayaran        VARCHAR2(20) NOT NULL,
    produk_id_produk         INTEGER NOT NULL,
    pelanggan_id_pelanggan   INTEGER NOT NULL,
    pengiriman_no_resi       INTEGER NOT NULL
);

ALTER TABLE pemesanan ADD CONSTRAINT pemesanan_pk PRIMARY KEY ( id_pesanan );

CREATE TABLE pengiriman (
    no_resi              INTEGER NOT NULL,
    kurir                VARCHAR2(20 BYTE) NOT NULL,
    status_pengiriman    VARCHAR2(20 BYTE) NOT NULL,
    tanggal_pengiriman   DATE NOT NULL
);

ALTER TABLE pengiriman ADD CONSTRAINT pengiriman_pk PRIMARY KEY ( no_resi );

CREATE TABLE produk (
    id_produk     INTEGER NOT NULL,
    nama_produk   VARCHAR2(50 BYTE) NOT NULL,
    deskripsi     VARCHAR2(50 BYTE) NOT NULL,
    harga         NUMBER NOT NULL
);

ALTER TABLE produk ADD CONSTRAINT produk_pk PRIMARY KEY ( id_produk );

ALTER TABLE pemesanan
    ADD CONSTRAINT pemesanan_pelanggan_fk FOREIGN KEY ( pelanggan_id_pelanggan )
        REFERENCES pelanggan ( id_pelanggan );

ALTER TABLE pemesanan
    ADD CONSTRAINT pemesanan_pengiriman_fk FOREIGN KEY ( pengiriman_no_resi )
        REFERENCES pengiriman ( no_resi );

ALTER TABLE pemesanan
    ADD CONSTRAINT pemesanan_produk_fk FOREIGN KEY ( produk_id_produk )
        REFERENCES produk ( id_produk );
