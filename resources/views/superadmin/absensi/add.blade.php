<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <input type="time" class="form-control" name="waktu" id="waktu" readonly
                                    value="{{ now()->format('H:i') }}" placeholder="Masukan Nama waktu">
                                <input type="text" name="tanggal" value="{{ now()->format('Y-m-d') }}" hidden>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email" class="form-label">Keterangan <span
                                        class="text-danger">*</span></label>
                                <select name="keterangan" class="form-select">
                                    <option selected disabled>== Pilih Keterangan ==</option>
                                    <option value="pagi">Pagi</option>
                                    <option value="apoteker">Apoteker</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Status <span class="text-danger">*</span></label>
                                <select name="status" class="form-select">
                                    <option selected disabled>== Pilih Status ==</option>
                                    <option value="dalam_kota">Dalam Kota</option>
                                    <option value="akamtri">Akamtri (CIC)</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Foto Marki <span class="text-danger">*</span></label>
                                <div class="mt-3 mb-3">
                                    <img id="preview" src="#" alt="Preview Foto" class="img-fluid d-none"
                                        style="max-width: 200px; max-height: 200px;">
                                </div>
                                <input type="file" required class="form-control" name="foto_marki" accept="image/*"
                                    id="foto_marki" onchange="previewImage()">
                            </div>
                        </div>
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
<script>
    function previewImage() {
        var input = document.getElementById('foto_marki');
        var preview = document.getElementById('preview');

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.classList.remove('d-none');
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>