const prisma = require('../config/prisma');

const BULAN_ROMAWI = ['I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII'];

/**
 * Generate nomor surat otomatis
 * Format: 87.1992/Urutan-Surat.Bulan-Romawi/YAPINU/Tahun
 * Contoh: 87.1992/001.VI/YAPINU/2026
 */
async function generateNomorSurat(jenisSurat = 'A') {
  const now   = new Date();
  const tahun = now.getFullYear();
  const bulan = now.getMonth() + 1;

  const startOfMonth = new Date(tahun, bulan - 1, 1);
  const endOfMonth   = new Date(tahun, bulan, 0, 23, 59, 59);

  const count = await prisma.suratKeluar.count({
    where: {
      createdAt: { gte: startOfMonth, lte: endOfMonth },
      nomorSurat: { not: null },
    },
  });

  const urutan       = String(count + 1).padStart(3, '0');
  const bulanRomawi  = BULAN_ROMAWI[bulan - 1];

  return `87.1992/${urutan}.${bulanRomawi}/${jenisSurat}/YAPINU/${tahun}`;
}

function buatSingkatan(tingkatan, namaOrg) {
  const singkatTingkatan = tingkatan
    .split(' ')
    .map(w => w[0]?.toUpperCase() || '')
    .join('');
  const singkatNama = namaOrg
    .split(' ')
    .map(w => w[0]?.toUpperCase() || '')
    .join('');
  return `${singkatTingkatan}-${singkatNama}`;
}

module.exports = { generateNomorSurat, buatSingkatan };
