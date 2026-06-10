# Panduan Deploy RISALATIN ke Hostinger

## Informasi Server
- **Domain:** https://risalatin.sukamiskin.ponpes.id
- **Database:** u217293837_dbrisalatin26
- **DB User:** u217293837_risalatin26
- **Node.js:** pastikan versi ≥ 18

---

## Langkah 1 — Import Database

1. Login ke **hPanel Hostinger** → **Databases → MySQL Databases**
2. Buka **phpMyAdmin** untuk database `u217293837_dbrisalatin26`
3. Klik tab **Import**
4. Pilih file `risalatin_export.sql` dari folder ini
5. Klik **Go / Kirim**

---

## Langkah 2 — Upload File Backend

Upload seluruh folder `backend/` ke server (via File Manager atau FTP), **kecuali**:
- `node_modules/` (akan di-install di server)
- `.env` (ganti dengan `.env.production`)

### Rename file env:
```
backend/.env.production  →  backend/.env
```

---

## Langkah 3 — Install Dependencies

Di terminal SSH server, masuk ke folder backend:
```bash
cd ~/public_html/backend   # sesuaikan path
npm install --omit=dev
npx prisma generate
```

---

## Langkah 4 — Build Frontend

Di komputer lokal, jalankan build:
```cmd
cd frontend
npm run build
```
Hasil build otomatis masuk ke `backend/public/`.
Upload folder `backend/public/` ke server.

---

## Langkah 5 — Konfigurasi Node.js di Hostinger

1. hPanel → **Node.js** → **Create Application**
2. Isi:
   - **Node.js version:** 18.x atau 20.x
   - **Application root:** folder backend (misal `backend/`)
   - **Application URL:** risalatin.sukamiskin.ponpes.id
   - **Application startup file:** `src/server.js`
3. Klik **Create**

---

## Langkah 6 — Jalankan & Verifikasi

```bash
# Restart aplikasi dari hPanel Node.js, atau via SSH:
npm start
```

Cek health endpoint:
```
https://risalatin.sukamiskin.ponpes.id/api/health
```

---

## Akun Default Setelah Import

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@sirama.com | admin123 |
| Tata Usaha | tatausaha@sirama.com | password123 |
| Kepala | kepala@sirama.com | password123 |
| Guru | guru1@sirama.com | password123 |

> ⚠️ **Segera ganti semua password setelah login pertama!**

---

## Catatan Penting

- File `risalatin_export.sql` berisi struktur tabel + data awal (seed)
- Migrations sudah ter-include dalam SQL export — tidak perlu `prisma migrate deploy`
- Folder `uploads/` harus dibuat manual di server jika belum ada
- VAPID keys di `.env.production` bisa di-generate ulang dengan:
  ```bash
  npx web-push generate-vapid-keys
  ```
