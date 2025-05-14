<div class="modal fade" id="addData" tabindex="1000" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('absensi.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data Absensi || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="waktu" class="form-label">Jam <span class="text-danger">*</span></label>
                                <input type="time" class="form-control" id="waktu" readonly
                                    value="{{ now()->format('H:i') }}" placeholder="Masukan Nama waktu">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email" class="form-label">Keterangan <span
                                        class="text-danger">*</span></label>
                                <select name="keterangan" class="form-select">
                                    <option selected disabled>== Pilih Keterangan ==</option>
                                    <option value="masuk">Masuk</option>
                                    <option value="izin">Izin</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Status <span class="text-danger">*</span></label>
                                <select name="status" class="form-select">
                                    <option selected disabled>== Pilih Status ==</option>
                                    <option value="dalam_kota">Dalam Kota</option>
                                    <option value="luar_kota">Luar Kota</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12" style="display: none">
                            <div class="mb-3">
                                <label class="form-label">Alasan <span class="text-danger">*</span></label>
                                <textarea name="alasan" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label" id="labelFoto">Foto <span class="text-danger">*</span></label>
                                <div class="mt-3 mb-3">
                                    <img id="preview" src="#" alt="Preview Foto" class="img-fluid d-none"
                                        style="max-width: 200px; max-height: 200px;">
                                </div>
                                <input type="file" required class="form-control" name="foto_marki" accept="image/*"
                                    id="foto_marki" onchange="previewImage()">
                            </div>
                        </div>
                        <input type="text" name="latitude" class="form-control" hidden>
                        <input type="text" name="longitude" class="form-control" hidden>
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
        document.addEventListener("DOMContentLoaded", function() {
            if (navigator.geolocation) {
                navigator.permissions.query({
                    name: "geolocation"
                }).then((permission) => {
                    if (permission.state === "granted") {
                        navigator.geolocation.getCurrentPosition(updateLocation, showError, {
                            enableHighAccuracy: true
                        });
                    } else {
                        showError({
                            code: 1
                        });
                    }
                });
            } else {
                alert("Geolocation tidak didukung di browser ini.");
            }
        });

        document.addEventListener("DOMContentLoaded", function() {
            const keteranganSelect = document.querySelector("select[name='keterangan']");
            const alasanField = document.querySelector("textarea[name='alasan']").closest(".col-md-12");
            const statusField = document.querySelector("select[name='status']").closest(".col-md-6");
            const keteranganField = keteranganSelect.closest(".col-md-6");
            const labelFoto = document.getElementById("labelFoto");

            function toggleFields() {
                if (keteranganSelect.value === "izin") {
                    alasanField.style.display = "block";
                    statusField.style.display = "none";
                    keteranganField.classList.remove("col-md-6");
                    keteranganField.classList.add("col-md-12");

                    labelFoto.innerHTML = 'Bukti Pendukung <span class="text-danger">*</span>';
                } else {
                    alasanField.style.display = "none";
                    statusField.style.display = "block";
                    keteranganField.classList.remove("col-md-12");
                    keteranganField.classList.add("col-md-6");

                    labelFoto.innerHTML = 'Foto <span class="text-danger">*</span>';
                }
            }


            keteranganSelect.addEventListener("change", toggleFields);

            // Panggil fungsi awal untuk memastikan tampilan awal sesuai
            toggleFields();
        });

        function updateLocation(position) {
            let lat = position.coords.latitude;
            let lng = position.coords.longitude;

            document.querySelector("input[name='latitude']").value = lat;
            document.querySelector("input[name='longitude']").value = lng;

            console.log(`Lokasi diperbarui: ${lat}, ${lng}`);
        }

        function showError(error) {
            let errorMsg = "Gagal mendapatkan lokasi: ";
            switch (error.code) {
                case 1:
                    errorMsg += "Izin lokasi ditolak oleh pengguna. Silakan izinkan lokasi di pengaturan browser.";
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

        function previewImage() {
            let input = document.getElementById("foto_marki");
            let preview = document.getElementById("preview");

            if (input.files && input.files[0]) {
                let reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.classList.remove("d-none");
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
@endpush
