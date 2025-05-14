@foreach ($data as $datas)
    @php
        $ajax = str_replace('-', '_', $datas->id);
    @endphp
    <div class="modal fade editModal" id="editData{{ $datas->id }}" data-id="{{ $datas->id }}" tabindex="1000"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <form action="{{ route('absensi.update', $datas->id) }}" method="POST" class="needs-validation"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Update Data Absensi ||
                            {{ config('app.name') }}
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="waktu" class="form-label">Jam <span
                                            class="text-danger">*</span></label>
                                    <input type="time" class="form-control" id="waktu" readonly
                                        value="{{ now()->format('H:i') }}" placeholder="Masukan Nama waktu">
                                </div>
                            </div>
                            <div class="col-md-6" id="keterangan-field-{{ $datas->id }}">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Keterangan <span
                                            class="text-danger">*</span></label>
                                    <select id="keterangan-{{ $datas->id }}" name="keterangan" class="form-select">
                                        <option>== Pilih Keterangan ==</option>
                                        <option value="masuk" {{ $datas->keterangan == 'masuk' ? 'selected' : '' }}>
                                            Masuk</option>
                                        <option value="izin" {{ $datas->keterangan == 'izin' ? 'selected' : '' }}>
                                            Izin</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Status <span class="text-danger">*</span></label>
                                    <select id="status-{{ $datas->id }}" name="status" class="form-select">
                                        <option selected disabled>== Pilih Status ==</option>
                                        <option value="dalam_kota"
                                            {{ $datas->status == 'dalam_kota' ? 'selected' : '' }}>Dalam Kota</option>
                                        <option value="luar_kota"
                                            {{ $datas->status == 'luar_kota' ? 'selected' : '' }}>Luar Kota</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12" style="display: none" id="alasan-field-{{ $datas->id }}">
                                <div class="mb-3">
                                    <label class="form-label">Alasan <span class="text-danger">*</span></label>
                                    <textarea id="alasan-{{ $datas->id }}" name="alasan" class="form-control" rows="3">{{ $datas->alasan ?? '' }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Foto Marki <span class="text-danger">*</span></label>
                                    <div class="mt-3 mb-3">
                                        <img id="previewEdit-{{ $datas->id }}"
                                            src="{{ asset('assets/foto_marki/' . $datas->foto_marki ?? '') }}"
                                            alt="Preview Foto"
                                            class="img-fluid @if ($datas->foto_marki) d-block @else d-none @endif"
                                            style="max-width: 200px; max-height: 200px;">
                                    </div>
                                    <input type="file" class="form-control" name="foto_marki" accept="image/*"
                                        id="foto_markiedit-{{ $datas->id }}"
                                        onchange="previewImageedit({{ $datas->id }})">
                                </div>
                            </div>
                            <input type="text" name="latitude" id="latitude-{{ $datas->id }}"
                                class="form-control" hidden>
                            <input type="text" name="longitude" id="longitude-{{ $datas->id }}"
                                class="form-control" hidden>
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
@endforeach

@push('scripts')
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const modals = document.querySelectorAll(".editModal");

            modals.forEach(modal => {
                const modalId = modal.getAttribute('data-id');

                // Menambahkan event listener untuk modal yang muncul
                modal.addEventListener("show.bs.modal", function() {
                    // Mendapatkan elemen keterangan, alasan, dan status
                    const keteranganSelect = document.getElementById('keterangan-' + modalId);
                    const alasanField = document.getElementById('alasan-field-' + modalId);
                    const statusField = document.getElementById('status-' + modalId)?.closest(
                        '.col-md-6');
                    const keteranganField = document.getElementById('keterangan-field-' + modalId);


                    // Memastikan lokasi diperbarui
                    if (navigator.geolocation) {
                        navigator.permissions.query({
                            name: "geolocation"
                        }).then((permission) => {
                            if (permission.state === "granted") {
                                navigator.geolocation.getCurrentPosition((position) => {
                                    document.getElementById("latitude-" + modalId)
                                        .value = position.coords.latitude;
                                    document.getElementById("longitude-" + modalId)
                                        .value = position.coords.longitude;
                                }, showError, {
                                    enableHighAccuracy: true
                                });
                            } else {
                                showError({
                                    code: 1
                                });
                            }
                        });
                    }

                    // Mengecek apakah keterangan adalah 'izin' dan menampilkan alasan
                    if (keteranganSelect && keteranganSelect.value === "izin") {
                        alasanField.style.display = "block"; // Tampilkan alasan
                        statusField.style.display = "none"; // Sembunyikan status
                        keteranganField.classList.remove("col-md-6");
                        keteranganField.classList.add("col-md-12"); // Ganti menjadi col-md-12
                    } else {
                        alasanField.style.display = "none"; // Sembunyikan alasan
                        statusField.style.display = "block"; // Tampilkan status
                        keteranganField.classList.remove("col-md-12");
                        keteranganField.classList.add("col-md-6"); // Kembalikan ke col-md-6
                    }
                });

                // Toggle fields visibility based on "keterangan" change
                const keteranganSelect = document.getElementById('keterangan-' + modalId);
                if (keteranganSelect) {
                    keteranganSelect.addEventListener('change', function() {
                        const alasanField = document.getElementById('alasan-field-' + modalId);
                        const statusField = document.getElementById('status-' + modalId)?.closest(
                            '.col-md-6');
                        const keteranganField = document.getElementById('keterangan-field-' +
                            modalId);

                        if (alasanField && statusField && keteranganField) {
                            if (keteranganSelect.value === "izin") {
                                alasanField.style.display = "block";
                                statusField.style.display = "none";
                                keteranganField.classList.remove("col-md-6");
                                keteranganField.classList.add("col-md-12");
                            } else {
                                alasanField.style.display = "none";
                                statusField.style.display = "block";
                                keteranganField.classList.remove("col-md-12");
                                keteranganField.classList.add("col-md-6");
                            }
                        }
                    });
                }

                // Function to preview the image
                function previewImageedit(modalId) {
                    const inputEdit = document.getElementById("foto_markiedit-" + modalId);
                    const previewEdit = document.getElementById("previewEdit-" + modalId);

                    if (inputEdit && inputEdit.files && inputEdit.files[0]) {
                        let reader = new FileReader();
                        reader.onload = function(e) {
                            previewEdit.src = e.target.result;
                            previewEdit.classList.remove("d-none");
                        };
                        reader.readAsDataURL(inputEdit.files[0]);
                    }
                }

                function showError(error) {
                    let errorMsg = "Gagal mendapatkan lokasi: ";
                    switch (error.code) {
                        case 1:
                            errorMsg += "Izin lokasi ditolak oleh pengguna.";
                            break;
                        case 2:
                            errorMsg += "Informasi lokasi tidak tersedia.";
                            break;
                        case 3:
                            errorMsg += "Permintaan lokasi melebihi batas waktu.";
                            break;
                        default:
                            errorMsg += "Terjadi kesalahan yang tidak diketahui.";
                            break;
                    }
                    alert(errorMsg);
                }
            });
        });
    </script>
@endpush
