<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('bug-report.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <!-- Input Judul -->
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="title" class="form-label">Judul <span
                                        class="text-danger">*</span></label>
                                <input type="text" value="{{ old('title') }}" name="title" class="form-control"
                                    placeholder="Judul .." id="title" required>
                            </div>
                        </div>

                        <!-- Input Deskripsi -->
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="content" class="form-label">Deskripsi Bug <span
                                        class="text-danger">*</span></label>
                                <textarea class="form-control" name="content" id="content" rows="4" placeholder="Deskripsi .." required>{{ old('content') }}</textarea>
                            </div>
                        </div>

                        <!-- Input Foto -->
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label" id="labelFoto">Foto <span class="text-danger">*</span></label>
                                <div class="mt-3 mb-3">
                                    <img id="preview" src="#" alt="Preview Foto" class="img-fluid"
                                        style="max-width: 200px; max-height: 200px; display: none;">
                                </div>
                                <input type="file" class="form-control" name="gambar" accept="image/*"
                                    id="foto_marki">
                            </div>
                        </div>
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

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const fileInput = document.getElementById("foto_marki");
        const preview = document.getElementById("preview");

        fileInput.addEventListener("change", function() {
            const file = fileInput.files[0];
            if (file && file.type.startsWith("image/")) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = "block"; // tampilkan preview
                };
                reader.readAsDataURL(file);
            } else {
                preview.style.display = "none"; // sembunyikan jika bukan gambar
                preview.src = "#";
            }
        });
    });
</script>
