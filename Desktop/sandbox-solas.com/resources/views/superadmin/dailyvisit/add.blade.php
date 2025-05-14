<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('daily-visit.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data Daily Visit ||
                        {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Nama Karyawan <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" required value="{{ Auth::user()->nama }}"
                                    placeholder="Masukan Nama Karyawan" disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Nama Dokter <span class="text-danger">*</span></label>
                                <select name="dokter_id" id="id_dokter" class="form-select select2" required>
                                    <option selected disabled>== Pilih Dokter ==</option>
                                    @php
                                        $dokter = App\Models\Dokter::all();
                                    @endphp
                                    @foreach ($dokter as $item)
                                        <option value="{{ $item->id }}"
                                            {{ old('id_dokter') == $item->id ? 'selected' : '' }}>
                                            {{ $item->dokter }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Waktu Kunjungan <span class="text-danger">*</span></label>
                                <select name="waktu_kunjungan" class="form-select" required>
                                    <option selected disabled>== Waktu Kunjungan ==</option>
                                    <option value="pagi" {{ old('waktu_kunjungan') == 'pagi' ? 'selected' : '' }}>Pagi
                                    </option>
                                    <option value="siang" {{ old('waktu_kunjungan') == 'siang' ? 'selected' : '' }}>
                                        Siang</option>
                                    <option value="malam" {{ old('waktu_kunjungan') == 'malam' ? 'selected' : '' }}>
                                        Malam</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Jenis Kunjungan <span class="text-danger">*</span></label>
                                <select name="jenis_kunjungan" id="jenisKunjungan" class="form-select" required>
                                    <option selected disabled>== Jenis Kunjungan ==</option>
                                    <option value="remiding"
                                        {{ old('jenis_kunjungan') == 'remiding' ? 'selected' : '' }}>Reminding</option>
                                    <option value="garapan"
                                        {{ old('jenis_kunjungan') == 'garapan' ? 'selected' : '' }}>
                                        Garapan</option>
                                    <option value="lainnya"
                                        {{ old('jenis_kunjungan') == 'lainnya' ? 'selected' : '' }}>
                                        Lainnya</option>
                                </select>
                            </div>

                            <div class="mb-3" id="textareaGarapan" style="display: none;">
                                <label class="form-label">Jenis Kunjungan Lainnya</label>
                                <textarea name="jenis_kunjungan_lainnya" class="form-control">{{ old('jenis_kunjungan_lainnya') }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Keperluan <span class="text-danger">*</span></label>
                                <textarea name="keperluan" class="form-control" rows="4" required>{{ old('keperluan') }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Foto Marki <span class="text-danger">*</span></label>
                                <div class="mt-3 mb-3">
                                    <img id="preview" src="#" alt="Preview Gambar" class="img-fluid d-none"
                                        style="max-width: 200px; max-height: 200px;">
                                </div>
                                <input type="file" class="form-control" name="keterangan" required accept="image/*"
                                    id="keterangan" onchange="previewImage()">
                            </div>
                        </div>
                        <input type="text" name="longitude" class="form-control" id="longitude" hidden>
                        <input type="text" name="latitude" class="form-control" id="latitude" hidden>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary"
                        data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

@push('scripts')
    <script>
        // Preview Gambar
        function previewImage() {
            let input = document.getElementById("keterangan");
            let preview = document.getElementById("preview");

            if (input.files && input.files[0]) {
                let file = input.files[0];
                let validTypes = ["image/jpeg", "image/png", "image/jpg"];

                // Validasi jenis file
                if (!validTypes.includes(file.type)) {
                    alert("Hanya file gambar (JPG, PNG) yang diperbolehkan.");
                    input.value = "";
                    return;
                }

                let reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.classList.remove("d-none");
                };
                reader.readAsDataURL(file);
            }
        }

        // Dapatkan Lokasi Pengguna (Longitude & Latitude)
        function getLocationTambah() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    document.getElementById("longitude").value = position.coords.longitude;
                    document.getElementById("latitude").value = position.coords.latitude;
                }, function(error) {
                    console.error("Error mendapatkan lokasi:", error.message);
                });
            } else {
                alert("Geolocation tidak didukung di browser ini.");
            }
        }

        // Panggil fungsi saat halaman dimuat
        document.addEventListener("DOMContentLoaded", function() {
            const selectJenis = document.getElementById('jenisKunjungan');
            const textareaGarapan = document.getElementById('textareaGarapan');

            function toggleTextarea() {
                if (selectJenis.value === 'lainnya') {
                    textareaGarapan.style.display = 'block';
                } else {
                    textareaGarapan.style.display = 'none';
                }
            }

            // Inisialisasi saat halaman dimuat
            toggleTextarea();

            // Update saat opsi berubah
            selectJenis.addEventListener('change', toggleTextarea);
        });
        document.addEventListener("DOMContentLoaded", getLocationTambah);
        $(document).ready(function() {
            let dokterData = {}; // Objek untuk menyimpan data dokter
            $('.select2').select2({
                dropdownParent: $('#addData'), // pastikan #addData adalah ID modal kamu
                placeholder: "--- Pilih Produk ---",
                theme: 'bootstrap-5',
                allowClear: true
            });
        });
    </script>
@endpush
