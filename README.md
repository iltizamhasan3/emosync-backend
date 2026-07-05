<h1 align="center">🧠 EmoSync — Backend API</h1>

<div align="center">
  <img src="https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel"/>
  <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL"/>
  <img src="https://img.shields.io/badge/Supabase-3FCF8E?style=for-the-badge&logo=supabase&logoColor=white" alt="Supabase"/>
  <img src="https://img.shields.io/badge/Railway-0B0D0E?style=for-the-badge&logo=railway&logoColor=white" alt="Railway"/>
  <img src="https://img.shields.io/badge/Sanctum-4A5568?style=for-the-badge&logo=laravel&logoColor=white" alt="Sanctum"/>
</div>

<br/>

<p align="center">
  🐘 REST API untuk mood tracking app &nbsp;·&nbsp; 🔐 Sanctum auth &nbsp;·&nbsp; 💬 Real-time chat &nbsp;·&nbsp; 💳 Simulasi pembayaran &nbsp;·&nbsp; 📊 Streak & dashboard
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

### Backend
| Teknologi | Kegunaan |
|-----------|----------|
| [Laravel 13](https://laravel.com/) | Framework PHP |
| [Sanctum](https://laravel.com/docs/sanctum) | API token auth (30 hari expiry) |
| [MySQL](https://www.mysql.com/) / [PostgreSQL](https://www.postgresql.org/) | Database relasional |
| [File Cache](https://laravel.com/docs/cache) | Cache driver |
| [Database Session](https://laravel.com/docs/session) | Session driver |
| [Database Queue](https://laravel.com/docs/queues) | Queue driver |

### Deployment
| Layanan | Fungsi |
|---------|--------|
| [Railway](https://railway.app/) | Hosting Laravel (serverless dormant) |
| [Supabase](https://supabase.com/) | PostgreSQL hosting (free 500MB) |

### Frontend
| Repo | Tech |
|------|------|
| [emosync](https://github.com/iltizamhasan3/emosync) | Flutter + Dart |

<hr/>

## 🚀 Deployed API

```
Base URL: https://emosync-backend-production.up.railway.app/api
```

Response format:
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

## ⚡ Fitur Unggulan

**🔥 Streak Tracking** — Backend hitung streak otomatis berdasarkan rangkaian check-in harian berurutan. Gap >1 hari reset ke 1.

**📈 Dashboard Cerdas** — Rata-rata mood (happy=4, calm=3, anxious=2, sad=1) + distribusi mingguan + grafik.

**💬 Real-time Chat** — Sistem pesan antar teman dengan unread counter per-friend dan auto mark-as-read.

**💳 Simulasi Pembayaran** — Flow end-to-end: create → VA/QRIS → simulate bayar → premium aktif. Virtual account per transaksi.

**🔒 Premium Gating** — Konten premium otomatis tersembunyi dari user free. Langganan dengan expiry date.

**🧠 Support Analyzer** — Analisis pola mood → rekomendasi level dukungan (aman/ringan/profesional).

<hr/>

## 🗄️ Database

| Tabel | Fungsi |
|-------|--------|
| `users` | Akun, premium status, streak |
| `mood_checkins` | Catatan mood harian |
| `pemicus` | Trigger mood (stres, lelah, dll) |
| `checkin_pemicus` | Relasi checkin ↔ pemicu |
| `friendships` | Relasi pertemanan + status |
| `chats` | Pesan antar teman |
| `contents` | Artikel/video/kutipan |
| `subscriptions` | Langganan premium |
| `transactions` | Riwayat pembayaran |
| `user_settings` | Notifikasi & privasi per user |

<hr/>

## 🖥️ Running Locally

```bash
git clone https://github.com/iltizamhasan3/emosync-backend.git
cd emosync-backend

composer install
cp .env.example .env
php artisan key:generate

# Setup MySQL database, lalu:
php artisan migrate
php artisan db:seed --class=PemicuSeeder

php artisan serve
# API aktif di http://localhost:8000/api
```

<hr/>

<div align="center">
  <p>Dibuat dengan ❤️ menggunakan Laravel & Flutter</p>
  <p>
    <a href="https://github.com/iltizamhasan3/emosync">Frontend Repo</a> •
    <a href="https://github.com/iltizamhasan3/emosync-backend">Backend Repo</a>
  </p>
</div>
