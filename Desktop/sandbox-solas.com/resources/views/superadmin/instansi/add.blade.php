<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('instansi.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data Instansi || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="instansi" class="form-label">Nama Outlet <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="instansi" id="instansi" required
                                    value="{{ old('instansi') }}" placeholder="Masukan Nama Outlet">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Kategori <span class="text-danger">*</span></label>
                                <select class="form-select select2" name="kategori">
                                    <option selected disabled>== Pilih Kategori ==</option>
                                    <option value="apotek">Apotek</option>
                                    <option value="rs">Rumah Sakit</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">email <span class="text-primary">*</span></label>
                                <input type="email" name="email" class="form-control" value="{{ old('email') }}"
                                    placeholder="Masukan Alamat Email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">No Telp <span class="text-primary">*</span></label>
                                <input type="no_hp" name="no_hp" class="form-control" value="{{ old('no_hp') }}"
                                    placeholder="Masukan Alamat No Telp">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Alamat <span class="text-primary">*</span></label>
                                <textarea name="alamat" class="form-control" rows="3">{{ old('alamat') }}</textarea>
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