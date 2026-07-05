<h1 align="center">🧠 EmoSync — Backend API</h1>

<div align="center">
  <img src="https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel"/>
  <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
  <img src="https://img.shields.io/badge/Sanctum-4A5568?style=for-the-badge&logo=laravel&logoColor=white" alt="Sanctum"/>
</div>

<br/>

<p align="center">
  🐘 REST API untuk mood tracking app &nbsp;·&nbsp; 🔐 Sanctum auth &nbsp;·&nbsp; 💬 Chat &nbsp;·&nbsp; 💳 Simulasi pembayaran &nbsp;·&nbsp; 📊 Streak & dashboard
</p>

<hr/>

## ✨ Fitur API

### 🔐 Autentikasi
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/register` | `POST` | Registrasi akun + default settings |
| `/api/login` | `POST` | Login via email/username |
| `/api/logout` | `POST` | Hapus token Sanctum |
| `/api/user` | `GET` | Data user saat ini |

### 👤 Profil
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/profile` | `GET` | Lihat profil |
| `/api/profile` | `PUT` | Edit nama & avatar |

### 📊 Mood Check-in
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/checkin` | `POST` | Catat mood (happy/anxious/calm/sad) + pemicu |
| `/api/checkin` | `GET` | Riwayat 30 check-in terakhir |
| `/api/dashboard` | `GET` | Streak, grafik mingguan, distribusi mood |
| `/api/pemicu` | `GET` | Daftar trigger mood |

### 👥 Pertemanan
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/friends` | `GET` | Daftar teman |
| `/api/friends/add` | `POST` | Kirim permintaan via username |
| `/api/friends/search` | `GET` | Cari user |
| `/api/friends/requests` | `GET` | Permintaan masuk/keluar |
| `/api/friends/accept/{id}` | `POST` | Terima permintaan |
| `/api/friends/{id}` | `DELETE` | Hapus teman / tolak |

### 💬 Chat
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/chat/{friendId}` | `GET` | Riwayat pesan dengan teman |
| `/api/chat/send` | `POST` | Kirim pesan |
| `/api/chat/unread/count` | `GET` | Total pesan belum dibaca |
| `/api/chat/unread/list` | `GET` | Per-friend unread count |
| `/api/chat/read/{friendId}` | `PUT` | Tandai sudah dibaca |

### 📚 Konten
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/konten` | `GET` | Daftar konten, premium tersembunyi |
| `/api/konten/{id}` | `GET` | Detail konten, premium terkunci |

### ⚙️ Pengaturan
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/settings` | `GET` | Notifikasi & privasi |
| `/api/settings/notification` | `PUT` | Update notifikasi |
| `/api/settings/privacy` | `PUT` | Update privasi |

### 💎 Premium & Pembayaran
| Endpoint | Method | Deskripsi |
|----------|--------|-----------|
| `/api/premium/status` | `GET` | Status premium |
| `/api/premium/plans` | `GET` | Paket harga |
| `/api/premium/subscribe` | `POST` | Langganan premium |
| `/api/premium/cancel` | `POST` | Batalkan langganan |
| `/api/payment/plans` | `GET` | Opsi pembayaran |
| `/api/payment/create` | `POST` | Buat transaksi (QRIS/VA) |
| `/api/payment/status/{id}` | `GET` | Cek status transaksi |
| `/api/payment/simulate/{id}` | `POST` | Simulasi bayar (demo) |
| `/api/payment/cancel/{id}` | `DELETE` | Batal transaksi |
| `/api/payment/history` | `GET` | Riwayat transaksi |

<hr/>

## 🛠️ Tech Stack

| Teknologi | Kegunaan |
|-----------|----------|
| [Laravel 13](https://laravel.com/) | Framework PHP |
| [PHP ^8.3](https://www.php.net/) | Bahasa pemrograman |
| [Sanctum ^4.0](https://laravel.com/docs/sanctum) | API token auth (30 hari expiry) |
| [PostgreSQL (Supabase)](https://supabase.com/) | Database relasional utama (production) |
| [MySQL 8.0](https://www.mysql.com/) | Database relasional (local dev) |
| [Supabase Storage (S3)](https://supabase.com/) | File & media storage |
| [Docker](https://www.docker.com/) | Containerization (Nginx + PHP-FPM + Supervisor) |
| [Vite 8](https://vitejs.dev/) | Asset bundler |
| [TailwindCSS 4](https://tailwindcss.com/) | CSS utility framework |
| [Node.js](https://nodejs.org/) | Build toolchain |

<hr/>

## ⚡ Fitur Unggulan

**🔥 Streak Tracking** — Backend hitung streak otomatis berdasarkan rangkaian check-in harian berurutan. Gap >1 hari reset ke 1.

**📈 Dashboard Cerdas** — Rata-rata mood (happy=4, calm=3, anxious=2, sad=1) + distribusi mingguan + grafik.

**💬 Chat** — Sistem pesan antar teman dengan unread counter per-friend dan auto mark-as-read.

**💳 Simulasi Pembayaran** — Flow end-to-end: create → VA/QRIS → simulate bayar → premium aktif.

**🔒 Premium Gating** — Konten premium otomatis tersembunyi dari user free. Langganan dengan expiry date.

**🧠 Support Analyzer** — Analisis pola mood → rekomendasi level dukungan (aman/ringan/profesional).

<hr/>

## 🖥️ Running Locally

### Prasyarat
- PHP ^8.3
- Composer
- PostgreSQL (atau pakai Docker)
- Node.js & npm

### Setup

```bash
git clone https://github.com/iltizamhasan3/emosync-backend.git
cd emosync-backend

composer install
cp .env.example .env
php artisan key:generate
```

### Database

Project mendukung PostgreSQL (production) dan MySQL (local). Atur `.env` sesuai kebutuhan:

**PostgreSQL (default):**
```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=emosync
DB_USERNAME=postgres
DB_PASSWORD=
```

**MySQL:**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=emosync
DB_USERNAME=root
DB_PASSWORD=
```

Atau jalankan dengan Docker (MySQL):
```bash
docker compose up -d
```

Jalankan migrasi & seeder:

```bash
php artisan migrate
php artisan db:seed --class=PemicuSeeder
```

### Jalankan Server

```bash
php artisan serve
# API aktif di http://localhost:8000/api
```

### Response Format

```json
{
  "success": true,
  "data": { ... },
  "message": "..."
}
```

Semua protected endpoint require header:

```
Authorization: Bearer <sanctum_token>
Accept: application/json
```

<hr/>

<div align="center">
  <p>Dibuat dengan ❤️ menggunakan Laravel & Flutter</p>
  <p>
    <a href="https://github.com/iltizamhasan3/emosync">Frontend (Flutter)</a> •
    <a href="https://github.com/iltizamhasan3/emosync-backend">Backend API</a> •
    <a href="https://github.com/iltizamhasan3/emosync-admin">Admin Panel</a>
  </p>
</div>
