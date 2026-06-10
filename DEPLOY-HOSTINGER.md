# Panduan Deploy RISALAT ke Hostinger (via GitHub)

## Informasi Server
- **Domain:** https://risalat.nukotabandung.or.id
- **Database:** u167347310_risalat26db
- **DB User:** u167347310_risalat26user
- **DB Password:** Risalat26
- **Node.js:** 18.x atau 20.x

---

## Langkah 1 — Build Frontend (di komputer lokal)

Sebelum push ke GitHub, build frontend dulu agar `backend/public/` ter-update:

```cmd
cd frontend
npm install
npm run build
```

Hasil build otomatis masuk ke `backend/public/`. Pastikan folder ini ikut di-commit.

> Catatan: `backend/public/assets/` dikecualikan dari gitignore, jadi pastikan
> hapus baris `backend/public/assets/` dari `.gitignore` jika ingin assets ikut commit,
> **atau** lakukan build langsung di server via SSH (lihat Langkah 4 alternatif).

---

## Langkah 2 — Push ke GitHub

```cmd
git add .
git commit -m "Deploy RISALAT YAPINU"
git push origin main
```

---

## Langkah 3 — Setup Database di Hostinger

1. Login ke **hPanel Hostinger**
2. Pergi ke **Databases → MySQL Databases**
3. Pastikan database `u167347310_risalat26db` sudah ada
4. Buka **phpMyAdmin** untuk database tersebut
5. Klik tab **Import**
6. Pilih file `risalatin_export.sql` dari folder project ini
7. Klik **Go / Kirim**

> Jika ini instalasi baru (tanpa import SQL), tabel akan dibuat otomatis
> oleh Prisma saat server pertama kali dijalankan.

---

## Langkah 4 — Konfigurasi Node.js di Hostinger

1. hPanel → **Node.js** → **Create Application**
2. Isi konfigurasi:
   - **Node.js version:** 18.x atau 20.x
   - **Application root:** `backend/` *(path relatif dari public_html atau sesuai struktur repo)*
   - **Application URL:** `risalat.nukotabandung.or.id`
   - **Application startup file:** `src/server.js`
3. Klik **Create**

---

## Langkah 5 — Upload File .env ke Server

File `.env.production` **tidak ikut ke GitHub** (dikecualikan gitignore).
Upload manual via **File Manager Hostinger** atau FTP:

1. Buka File Manager hPanel
2. Navigasi ke folder `backend/` di server
3. Upload file `backend/.env.production` dari komputer lokal
4. **Rename** menjadi `.env`

Isi file `.env` yang harus ada di server:
```env
DATABASE_URL="mysql://u167347310_risalat26user:Risalat26@localhost:3306/u167347310_risalat26db"
JWT_SECRET="risalat-yapinu-nukotabandung-jwt-2026-secret-key-production"
JWT_EXPIRES_IN="7d"
PORT=3000
NODE_ENV=production
FRONTEND_URL="https://risalat.nukotabandung.or.id"
UPLOAD_DIR="uploads"
MAX_FILE_SIZE=10485760
VAPID_PUBLIC_KEY="BCqHigob4ex31bdFNrIuGWVGytxEOMX67v57R4rBCZOs1tIsN8YacH_QED5yiizg3WLXJCrLwrkJ4K19cTnGyvY"
VAPID_PRIVATE_KEY="R_deBZGPp-mdty6V75gfmA77emmcUJ1lmJgI4xcKaAE"
VAPID_EMAIL="mailto:admin@nukotabandung.or.id"
SETUP_SECRET="risalat-setup-yapinu-2026"
```

---

## Langkah 6 — Install Dependencies & Generate Prisma

Via terminal SSH Hostinger atau tombol **Run NPM Command** di hPanel Node.js:

```bash
# Masuk ke folder backend
cd ~/domains/risalat.nukotabandung.or.id/public_html/backend
# (sesuaikan path dengan struktur di Hostinger)

npm install --omit=dev
npx prisma generate
```

---

## Langkah 7 — Buat Folder uploads

Via SSH atau File Manager, buat folder di dalam `backend/`:

```bash
mkdir -p uploads/logos
mkdir -p uploads/qrcodes
mkdir -p uploads/surat-masuk
mkdir -p uploads/photos
```

---

## Langkah 8 — Jalankan / Restart Aplikasi

Dari hPanel Node.js → klik **Restart** pada aplikasi.

Verifikasi server berjalan:
```
https://risalat.nukotabandung.or.id/api/health
```

Response yang diharapkan:
```json
{
  "success": true,
  "message": "RISALAT berjalan dengan baik"
}
```

---

## Langkah 9 — Seed Database (jika instalasi baru)

Jika **tidak** menggunakan import SQL, jalankan seed via endpoint:

```
POST https://risalat.nukotabandung.or.id/api/setup/seed
Header: x-setup-secret: risalat-setup-yapinu-2026
```

Atau via SSH:
```bash
cd ~/domains/risalat.nukotabandung.or.id/public_html/backend
node prisma/seed.js
```

---

## Akun Default Setelah Seed

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@sirama.com | admin123 |
| Tata Usaha | tatausaha@sirama.com | password123 |
| Kepala | kepala@sirama.com | password123 |
| Guru | guru1@sirama.com | password123 |

> ⚠️ **Segera ganti semua password dan email setelah login pertama!**
> Update profil organisasi ke data YAPINU di menu **Profil Yayasan**.

---

## Update / Re-deploy (berikutnya)

Setiap ada perubahan kode:

1. Build frontend lokal: `cd frontend && npm run build`
2. Commit & push: `git add . && git commit -m "update" && git push`
3. Di hPanel → **Git** → **Pull** (atau aktifkan auto-deploy)
4. Restart aplikasi Node.js dari hPanel

---

## Catatan Penting

- File `.env` di server **tidak** akan tertimpa saat git pull (karena dikecualikan di gitignore)
- Folder `uploads/` di server berisi file yang diupload user — **jangan dihapus**
- Jika VAPID keys ingin diganti (opsional): `npx web-push generate-vapid-keys`
- `SETUP_SECRET` sebaiknya dikosongkan atau dihapus dari `.env` setelah seeding selesai
