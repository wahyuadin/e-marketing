<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('pengumuman.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="document_type" class="form-label">Created By <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" value="{{ Auth::user()->nama }}" readonly
                                    placeholder="Masukan Nama Staff">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">Judul Pengumuman <span
                                        class="text-danger">*</span></label>
                                <input type="text" value="{{ old('title') }}" name="title" class="form-control"
                                    placeholder="Masukan Judul Pengumuman">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="nama_singkat" name="spesialis" class="form-label">Content <span
                                        class="text-danger">*</span></label>
                                <textarea name="content" rows="7" class="form-control" placeholder="Masukan Isi Pengumuman">{{ old('content') }}</textarea>
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
