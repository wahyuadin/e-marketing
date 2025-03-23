<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('karyawan.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                        Tambah Data Karyawan || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <!-- Kolom 1 -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="nama" class="form-label">Nama Karyawan <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="nama" id="nama" required
                                    value="{{ old('nama') }}" placeholder="Nama Karyawan">
                            </div>
                            <div class="mb-3">
                                <label for="no_hp" class="form-label">No Telepon
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="number" class="form-control" name="no_hp" id="no_hp" required
                                    value="{{ old('no_hp') }}" placeholder="No Telepon">
                            </div>
                            <div class="mb-3">
                                <label for="nip" class="form-label">NIP <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="nip" id="nip" required
                                    value="{{ old('nip') }}" placeholder="NIP">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password <span
                                        class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="password" class="form-control" name="password" id="addpwd" required
                                        value="{{ old('password') ?? 'password' }}" placeholder="Masukan Password">
                                    <button class="btn btn-outline-secondary" type="button" id="addpw">
                                        <i class="bx bx-show"></i>
                                    </button>
                                </div>
                                <div class="form-text">
                                    <span class="text-danger">*Password default adalah <strong>password</strong></span>
                                </div>
                            </div>
                        </div>

                        <!-- Kolom 2 -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email <span
                                        class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" id="email" required
                                    value="{{ old('email') }}" placeholder="Email">
                            </div>
                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat
                                    <span class="text-danger">*</span>
                                </label>
                                <textarea name="alamat" class="form-control" rows="3" style="height: 123px;">{{ old('alamat') }}</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="role" class="form-label">
                                    Role <span class="text-danger">*</span>
                                </label>
                                <select name="role" id="role" class="form-select" required>
                                    <option disabled selected>== Pilih Role ==</option>
                                    <option value="superadmin" {{ old('role') == 'superadmin' ? 'selected' : '' }}>
                                        Super Admin</option>
                                    <option value="admin" {{ old('role') == 'admin' ? 'selected' : '' }}>Admin
                                    </option>
                                    <option value="mr" {{ old('role') == 'mr' ? 'selected' : '' }}>MR</option>
                                    <option value="am" {{ old('role') == 'am' ? 'selected' : '' }}>AM</option>
                                    <option value="rsm" {{ old('role') == 'rsm' ? 'selected' : '' }}>RSM</option>
                                    <option value="nsm" {{ old('role') == 'nsm' ? 'selected' : '' }}>NSM</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <!-- Foto dengan Preview -->
                            <div class="mb-3">
                                <label for="foto" class="form-label">Foto</label>
                                <div class="d-flex justify-content-start">
                                    <img id="preview" src="{{ asset('assets/profile/default.png') }}"
                                        alt="Preview Foto" class="img-fluid rounded-circle"
                                        style="max-width: 150px; height: 150px; object-fit: cover;">
                                </div>
                                <input type="file" class="form-control mt-2" name="foto" id="foto"
                                    accept="image/*" onchange="previewImage(event)">
                                <div class="form-text">
                                    <span class="text-danger">*Foto harus berukuran 100x100px dan format jpg, jpeg,
                                        png</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary"
                        data-bs-dismiss="modal">Close</button>
                    <button type="submit" id="submitButtonPost" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
