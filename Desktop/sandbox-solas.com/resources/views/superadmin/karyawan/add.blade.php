<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('karyawan.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="karyawan" class="form-label">Nama Karyawan <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="nama" id="karyawan" required
                                    value="{{ old('nama') }}" placeholder="Masukan Nama Karyawan">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="Email" class="form-label">Email <span
                                        class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" id="email" required
                                    value="{{ old('email') }}" placeholder="Masukan Email">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="karyawan" class="form-label">NIP <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="nip" id="nip" required
                                    value="{{ old('nip') }}" placeholder="Masukan NIP">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="password" class="form-label">Password <span
                                        class="text-danger">*</span></label>
                                <input type="password" class="form-control" name="password" id="password" required
                                    value="{{ old('password') }}" placeholder="Masukan Password">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="karyawan" class="form-label">No Hp <span
                                        class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="no_hp" id="no_hp" required
                                    value="{{ old('no_hp') }}" placeholder="Masukan Nama Karyawan">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Jabatan / Role <span class="text-danger">*</span></label>
                                <select name="role" class="form-select" required>
                                    <option selected disabled>== Pilih Salah Satu ==</option>
                                    <option value="superadmin" {{ old('role') == 'superadmin' ? 'selected' : '' }}>Super
                                        Admin</option>
                                    <option value="admin" {{ old('role') == 'admin' ? 'selected' : '' }}>Admin</option>
                                    <option value="mr" {{ old('role') == 'mr' ? 'selected' : '' }}>MR</option>
                                    <option value="am" {{ old('role') == 'am' ? 'selected' : '' }}>AM</option>
                                    <option value="rsm" {{ old('role') == 'rsm' ? 'selected' : '' }}>RSM</option>
                                    <option value="nsm" {{ old('role') == 'nsm' ? 'selected' : '' }}>NSM</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="karyawan" class="form-label">Alamat <span
                                        class="text-danger">*</span></label>
                                <textarea name="alamat" class="form-control" rows="3">{{ old('alamat') }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="password" class="form-label">Foto Profile <span
                                        class="text-primary">*</span></label>
                                <input type="file" class="form-control" name="foto" id="foto"
                                    value="{{ old('foto') }}" placeholder="Masukan foto">
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
