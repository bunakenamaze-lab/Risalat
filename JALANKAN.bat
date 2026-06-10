@echo off
title RISALATIN - Menjalankan Server
color 0A

echo.
echo  ============================================
echo    RISALATIN - Repositori Informasi Surat
echo    dan Administrasi Pesantren
echo  ============================================
echo.

:: Cek apakah MySQL berjalan
echo [1/3] Memeriksa MySQL...
sc query MySQL80 | find "RUNNING" >nul 2>&1
if errorlevel 1 (
    echo       MySQL tidak berjalan. Mencoba menjalankan...
    net start MySQL80 >nul 2>&1
    timeout /t 3 /nobreak >nul
    sc query MySQL80 | find "RUNNING" >nul 2>&1
    if errorlevel 1 (
        echo       [GAGAL] MySQL tidak bisa dijalankan.
        echo       Jalankan manual: net start MySQL80
        pause
        exit /b 1
    )
)
echo       MySQL OK

:: Jalankan Backend
echo [2/3] Menjalankan Backend (port 5000)...
start "RISALATIN Backend" cmd /k "cd /d %~dp0backend && node src/server.js"
timeout /t 3 /nobreak >nul
echo       Backend OK

:: Jalankan Frontend
echo [3/3] Menjalankan Frontend (port 5173)...
start "RISALATIN Frontend" cmd /k "cd /d %~dp0frontend && npm run dev"
timeout /t 5 /nobreak >nul
echo       Frontend OK

echo.
echo  ============================================
echo    Aplikasi siap diakses!
echo    Buka browser: http://localhost:5173
echo  ============================================
echo.
echo  Login default:
echo    Admin      : admin@sirama.com / admin123
echo    Tata Usaha : tatausaha@sirama.com / password123
echo    Kepala     : kepala@sirama.com / password123
echo.

:: Buka browser otomatis
timeout /t 3 /nobreak >nul
start http://localhost:5173

echo  Tekan tombol apa saja untuk menutup jendela ini...
pause >nul
