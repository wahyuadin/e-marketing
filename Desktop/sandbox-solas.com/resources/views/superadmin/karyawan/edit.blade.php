@foreach ($data as $datas)
    <div class="modal fade" id="editData{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <form action="{{ route('karyawan.update', $datas->id) }}" method="POST" class="needs-validation"
                    enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Data Karyawan |
                            {{ config('app.name') }}</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="karyawan" class="form-label">Nama Karyawan <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="nama" id="karyawan" required
                                        value="{{ old('nama', $datas->nama) }}" placeholder="Masukan Nama Karyawan">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="Email" class="form-label">Email <span
                                            class="text-danger">*</span></label>
                                    <input type="email" class="form-control" name="email" id="email" required
                                        value="{{ old('email', $datas->email) }}" placeholder="Masukan Email">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="karyawan" class="form-label">NIP <span
                                            class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="nip" id="nip" required
                                        value="{{ old('nip', $datas->nip) }}" placeholder="Masukan NIP">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password <span
                                            class="text-danger">*</span></label>
                                    <input type="password" class="form-control" name="password" id="password"
                                        value="{{ old('password') }}" placeholder="Password Default: password">
                                    <small>* Kosongkan jika tidak ingin mengganti password</small>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="karyawan" class="form-label">No Hp <span
                                            class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="no_hp" id="no_hp" required
                                        value="{{ old('no_hp', $datas->no_hp) }}" placeholder="Masukan Nama Karyawan">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Jabatan / Role <span class="text-danger">*</span></label>
                                    <select name="role" class="form-select">
                                        <option selected disabled>== Pilih Salah Satu ==</option>
                                        <option value="superadmin" {{ $datas->role == 'superadmin' ? 'selected' : '' }}>
                                            Super Admin
                                        </option>
                                        <option value="admin" {{ $datas->role == 'admin' ? 'selected' : '' }}>
                                            Admin</option>
                                        <option value="mr" {{ $datas->role == 'mr' ? 'selected' : '' }}>MR
                                        </option>
                                        <option value="am" {{ $datas->role == 'am' ? 'selected' : '' }}>AM
                                        </option>
                                        <option value="rsm" {{ $datas->role == 'rsm' ? 'selected' : '' }}>RSM
                                        </option>
                                        <option value="nsm" {{ $datas->role == 'nsm' ? 'selected' : '' }}>NSM
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="karyawan" class="form-label">Alamat <span
                                            class="text-danger">*</span></label>
                                    <textarea name="alamat" class="form-control" rows="3">{{ old('alamat', $datas->alamat) }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="password" class="form-label">Foto Profile <span
                                            class="text-danger">*</span></label>
                                    <br>
                                    <img src="{{ asset('assets/profile/' . $datas->foto) }}"
                                        alt="{{ $datas->foto }}">
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
@endforeach
