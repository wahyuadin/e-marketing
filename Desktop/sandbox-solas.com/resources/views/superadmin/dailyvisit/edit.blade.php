@foreach ($data as $datas)
    <div class="modal fade" id="editData{{ $datas->id }}" tabindex="-199" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <form action="{{ route('daily-visit.update', $datas->id) }}" method="POST" class="needs-validation"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Data Daily Visit ||
                            {{ config('app.name') }}
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Nama Karyawan <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" required value="{{ $datas->user->nama }}"
                                        placeholder="Masukan Nama Karyawan" disabled>
                                </div>
                            </div>
                            @if ($datas->dokter_id == null)
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Outlet <span class="text-danger">*</span></label>
                                        <select name="dokter_id" class="form-select select2" required>
                                            <option selected disabled>== Pilih Outlet ==</option>
                                            @php
                                                $instansi = App\Models\Instansi::where(
                                                    'id',
                                                    $datas->instansi_id,
                                                )->get();
                                            @endphp
                                            @foreach ($instansi as $item)
                                                <option value="{{ $item->id }}"
                                                    {{ $datas->instansi_id == $item->id ? 'selected' : '' }}>
                                                    {{ $item->instansi }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            @else
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Dokter <span class="text-danger">*</span></label>
                                        <select name="dokter_id" class="form-select select2" required>
                                            <option selected disabled>== Pilih Dokter ==</option>
                                            @php
                                                $dokter = App\Models\Dokter::where('id', $datas->dokter_id)->get();
                                            @endphp
                                            @foreach ($dokter as $item)
                                                <option value="{{ $item->id }}"
                                                    {{ $datas->dokter_id == $item->id ? 'selected' : '' }}>
                                                    {{ $item->dokter }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            @endif
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Waktu Kunjungan <span class="text-danger">*</span></label>
                                    <select name="waktu_kunjungan" class="form-select" required>
                                        <option selected disabled>== Waktu Kunjungan ==</option>
                                        <option value="pagi"
                                            {{ old('waktu_kunjungan', $datas->waktu_kunjungan ?? '') == 'pagi' ? 'selected' : '' }}>
                                            Pagi
                                        </option>
                                        <option value="siang"
                                            {{ old('waktu_kunjungan', $datas->waktu_kunjungan ?? '') == 'siang' ? 'selected' : '' }}>
                                            Siang</option>
                                        <option value="malam"
                                            {{ old('waktu_kunjungan', $datas->waktu_kunjungan ?? '') == 'malam' ? 'selected' : '' }}>
                                            Malam</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Jenis Kunjungan <span class="text-danger">*</span></label>
                                    <select name="jenis_kunjungan"
                                        id="jenisKunjungan{{ str_replace('-', '_', $datas->id) }}" class="form-select"
                                        required>
                                        <option selected disabled>== Jenis Kunjungan ==</option>
                                        <option value="remiding"
                                            {{ $datas->jenis_kunjungan == 'remiding' ? 'selected' : '' }}>Reminding
                                        </option>
                                        <option value="garapan"
                                            {{ $datas->jenis_kunjungan == 'garapan' ? 'selected' : '' }}>
                                            Garapan</option>
                                        <option value="lainnya"
                                            {{ $datas->jenis_kunjungan == 'lainnya' ? 'selected' : '' }}>
                                            Lainnya</option>
                                    </select>
                                </div>

                                <div class="mb-3" id="textareaGarapan{{ str_replace('-', '_', $datas->id) }}"
                                    style="display: none;">
                                    <label class="form-label">Jenis Kunjungan Lainnya</label>
                                    <textarea name="jenis_kunjungan_lainnya" id="jenisKunjunganLainnya{{ str_replace('-', '_', $datas->id) }}"
                                        class="form-control">{{ old('jenis_kunjungan_lainnya', $datas->jenis_kunjungan_lainnya ?? '') }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Keperluan <span class="text-danger">*</span></label>
                                    <textarea name="keperluan" class="form-control" rows="4" required>{{ old('keperluan', $datas->keperluan ?? '') }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Keterangan <span class="text-danger">*</span></label>
                                    <div class="mt-3 mb-3">
                                        <img id="preview{{ $datas->id }}"
                                            src="{{ asset('assets/dailyvisit/' . $datas->keterangan) }}"
                                            alt="Preview Gambar"
                                            class="img-fluid @if (empty($datas->keterangan)) d-none @endif"
                                            style="max-width: 200px; max-height: 200px;">
                                    </div>
                                    <input type="file" class="form-control" name="keterangan" accept="image/*"
                                        id="keterangan{{ $datas->id }}"
                                        onchange="previewImage({{ $datas->id }})">
                                </div>
                            </div>
                            <input type="text" name="longitude" class="form-control"
                                id="longitude{{ str_replace('-', '_', $datas->id) }}" hidden>
                            <input type="text" name="latitude" class="form-control"
                                id="latitude{{ str_replace('-', '_', $datas->id) }}" hidden>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="closeModal" class="btn btn-secondary"
                                data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @push('scripts')
        <script>
            $(document).ready(function() {
                // Inisialisasi Select2 saat modal ditampilkan
                $('#editData{{ $datas->id }}').on('shown.bs.modal', function() {
                    $(this).find('.select2').select2({
                        dropdownParent: $('#editData{{ $datas->id }}'),
                        placeholder: "--- Pilih Dokter ---",
                        theme: 'bootstrap-5',
                        allowClear: true
                    });
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const selectJenis = document.getElementById('jenisKunjungan{{ str_replace('-', '_', $datas->id) }}');
                const textareaGarapan = document.getElementById(
                    'textareaGarapan{{ str_replace('-', '_', $datas->id) }}');
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        document.getElementById("longitude{{ str_replace('-', '_', $datas->id) }}');").value =
                            position
                            .coords.longitude;
                        document.getElementById("latitude{{ str_replace('-', '_', $datas->id) }}');").value =
                            position
                            .coords.latitude;
                    }, function(error) {
                        console.error("Error mendapatkan lokasi:", error.message);
                    });
                } else {
                    alert("Geolocation tidak didukung di browser ini.");
                }

                function toggleTextarea() {
                    if (selectJenis.value === 'lainnya') {
                        textareaGarapan.style.display = 'block';
                    } else {
                        textareaGarapan.style.display = 'none';
                        document.getElementById("jenisKunjunganLainnya{{ str_replace('-', '_', $datas->id) }}").value =
                            '';
                    }
                }

                // Inisialisasi saat halaman dimuat
                toggleTextarea();

                // Update saat opsi berubah
                selectJenis.addEventListener('change', toggleTextarea);
            });
        </script>
    @endpush
@endforeach
