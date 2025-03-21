<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ ucwords(str_replace(' ', ' ', config('app.name'))) }} | {{ 'Daily Visit' }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body {
            background-color: #ccd1ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 125vh;
            padding: 20px;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }

        .banner {
            width: 100%;
            height: 180px;
            background: url('{{ asset('assets/gedung.jpg') }}') center/cover no-repeat;
            border-radius: 12px 12px 0 0;
        }

        h1 {
            font-size: 1.8rem;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
            color: #333;
        }

        .form-label {
            font-weight: 600;
            color: #444;
        }

        .form-control,
        .form-select {
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: all 0.3s;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .btn-primary {
            border-radius: 8px;
            padding: 12px;
            font-size: 1rem;
            font-weight: 600;
            background: linear-gradient(135deg, #007bff, #0056b3);
            border: none;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #0056b3, #003f80);
        }

        .select2-container .select2-selection--single {
            height: 38px;
            border-radius: 8px;
            border: 1px solid #ccc;
            display: flex;
            align-items: center;
            padding: 5px;
        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-left: 10px;
            color: #555;
        }

        .select2-container .select2-selection--single .select2-selection__arrow {
            height: 100%;
            right: 10px;
        }
    </style>
</head>

<body>
    @include('sweetalert::alert')
    <div class="form-container">
        <div class="banner"></div>
        <h1>{{ strtoupper($data->nama ?? 'Format Salah') }}</h1>
        <p class="text-center text-muted">{{ ucfirst($data->deskripsi ?? '') }}</p>
        <form action="{{ route('form.store', $data->id) }}" method="POST" enctype="multipart/form-data">
            @include('alert')
            @csrf
            <div class="mb-3">
                <label class="form-label">Nama Karyawan</label>
                @php
                    $karyawan = App\Models\Karyawan::with('jabatan')->get();
                @endphp
                <select name="karyawan_id" class="form-select select2" required>
                    <option selected disabled>== Pilih Karyawan ==</option>
                    @foreach ($karyawan as $item)
                        <option value="{{ $item->id }}"
                            {{ old('karyawan_id', $data->karyawan_id ?? '') == $item->id ? 'selected' : '' }}>
                            {{ $item->nama_karyawan }} - {{ $item->jabatan->jabatan }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Instansi</label>
                @php
                    $instansi = App\Models\Instansi::all();
                @endphp
                <select name="instansi_id" class="form-select select2" required>
                    <option selected disabled>== Pilih Instansi ==</option>
                    @foreach ($instansi as $item)
                        <option value="{{ $item->id }}"
                            {{ old('instansi_id', $data->instansi_id ?? '') == $item->id ? 'selected' : '' }}>
                            {{ $item->instansi }} - {{ $item->alamat }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Dokter</label>
                @php
                    $dokter = App\Models\Dokter::with('spesialis')->get();
                @endphp
                <select class="form-select select2" name="dokter_id" required>
                    <option selected disabled>== Pilih Dokter ==</option>
                    @foreach ($dokter as $item)
                        <option value="{{ $item->id }}"
                            {{ old('dokter_id', $data->dokter_id ?? '') == $item->id ? 'selected' : '' }}>
                            {{ $item->dokter }} - {{ $item->spesialis->spesialis ?? 'Spesialis tidak ada' }}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Jenis Kunjungan</label>
                <select name="jenis_kunjungan" class="form-select select2">
                    <option selected disabled>== Pilih Jenis Kunjungan ==</option>
                    <option value="Pagi"
                        {{ old('jenis_kunjungan', $data->jenis_kunjungan ?? '') == 'Pagi' ? 'selected' : '' }}>
                        Pagi</option>
                    <option value="Siang"
                        {{ old('jenis_kunjungan', $data->jenis_kunjungan ?? '') == 'Siang' ? 'selected' : '' }}>
                        Siang</option>
                    <option value="Malam"
                        {{ old('jenis_kunjungan', $data->jenis_kunjungan ?? '') == 'Malam' ? 'selected' : '' }}>
                        Malam</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Keperluan</label>
                <input type="text" name="keperluan" class="form-control" placeholder="Masukkan keperluan"
                    value="{{ old('keperluan', $data->keperluan ?? '') }}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Keterangan</label>
                <input type="file" name="keterangan" class="form-control" required id="keteranganInput"
                    accept="image/*" value="{{ old('keterangan', $data->keterangan ?? '') }}">
                <br>
                <img id="previewImage" alt="Pratinjau Gambar" class="img-fluid mt-2 d-none"
                    style="max-width: 200px; border-radius: 8px;">
            </div>
            <input type="text" name="latitude" class="form-control" hidden>
            <input type="text" name="longitude" class="form-control" hidden>
            <input type="text" name="dailyvisit_id" class="form-control" value="{{ $data->id }}" hidden>
            <button type="submit" class="btn btn-primary w-100">Kirim</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.select2').select2({
                width: '100%'
            });
        });
        document.addEventListener("DOMContentLoaded", function() {
            let inputGambar = document.getElementById('keteranganInput');
            let preview = document.getElementById('previewImage');

            if (inputGambar) {
                inputGambar.addEventListener('change', function(event) {
                    let file = event.target.files[0];

                    if (file) {
                        let reader = new FileReader();
                        reader.onload = function(e) {
                            preview.src = e.target.result;
                            preview.classList.remove('d-none'); // Tampilkan gambar
                        }
                        reader.readAsDataURL(file);
                    }
                });
            }

            if (navigator.geolocation) {
                setInterval(() => {
                    navigator.geolocation.getCurrentPosition(updateLocation, showError, {
                        enableHighAccuracy: true
                    });
                }, 1000);
            } else {
                alert("Geolocation tidak didukung di browser ini.");
            }

            // Attach form submit event to ensure latitude and longitude are filled before submit
            $("form").submit(function(event) {
                if (!$("input[name='latitude']").val() || !$("input[name='longitude']").val()) {
                    event.preventDefault(); // Prevent form submission if latitude or longitude is empty
                    alert(
                        "Mohon maaf, Form belum dapat diakses. Silahkan izinkan lokasi terlebih dahulu. Disarankan menggunakan Google Chrome"
                    );
                    sessionStorage.clear();
                    location.reload();
                }
            });
        });

        function updateLocation(position) {
            let lat = position.coords.latitude;
            let lng = position.coords.longitude;

            console.log(`Latitude: ${lat}, Longitude: ${lng}`);

            document.querySelector("input[name='latitude']").value = lat;
            document.querySelector("input[name='longitude']").value = lng;
        }

        function showError(error) {
            let errorMsg = "Gagal mendapatkan lokasi: ";

            // Cek apakah notifikasi sudah ditampilkan dalam sesi ini
            if (!sessionStorage.getItem('locationErrorShown')) {
                switch (error.code) {
                    case error.PERMISSION_DENIED:
                        errorMsg += "Izin lokasi ditolak oleh pengguna, disarankan buka menggunakan Google Chrome.";
                        break;
                    case error.POSITION_UNAVAILABLE:
                        errorMsg += "Informasi lokasi tidak tersedia.";
                        break;
                    case error.TIMEOUT:
                        errorMsg += "Permintaan lokasi melebihi batas waktu.";
                        break;
                    case error.UNKNOWN_ERROR:
                        errorMsg += "Terjadi kesalahan yang tidak diketahui.";
                        break;
                }
                alert(errorMsg);

                // Tandai bahwa notifikasi sudah ditampilkan dalam sesi ini
                sessionStorage.setItem('locationErrorShown', 'true');
            }
        }
    </script>


</body>

</html>
