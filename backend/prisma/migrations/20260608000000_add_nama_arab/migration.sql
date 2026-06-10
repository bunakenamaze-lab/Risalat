-- Migration: add_nama_arab to OrganisasiProfil
ALTER TABLE `OrganisasiProfil`
  ADD COLUMN `namaArab` VARCHAR(500) NOT NULL DEFAULT '';
