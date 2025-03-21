<div class="modal-content">
    <form action="{{ route('master-user.store') }}" method="POST" class="needs-validation" enctype="multipart/form-data">
        @csrf
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">{{ $title }}</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="mb-3">
                <label for="nama" class="form-label">Nama <span class="text-danger">*</span></label>
                <input type="text" class="form-control" name="nama" id="nama" required
                    value="{{ old('nama') }}" placeholder="Masukan Nama">
            </div>
            <div class="mb-3">
                <label for="nip" class="form-label">NIP <span class="text-danger">*</span></label>
                <input type="text" class="form-control" name="nip" id="nip" required
                    value="{{ old('nip') }}" placeholder="Masukan NIP">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
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
            <div class="mb-3">
                <label for="accept" class="form-label">Role <span class="text-danger">*</span></label>
                <select name="accept" id="accept" class="form-control" required>
                    <option disabled selected>== Pilih Role ==</option>
                    <option value="1">Super Admin</option>
                    <option value="0">Admin</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="foto" class="form-label">Foto</label>
                <div class="d-flex justify">
                    <img src="{{ asset('assets/profile/default.png') }}" alt="logo" class="img-fluid rounded-circle"
                        style="max-width: 150px; height: 150px; object-fit: cover;">
                </div>
                <input type="file" class="form-control mt-2" name="foto" id="foto" accept="image/*">
                <div class="form-text">
                    <span class="text-danger">*Foto harus berukuran 100x100px dan format jpg, jpeg, png</span>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" id="submitButtonPost" class="btn btn-primary">Simpan</button>
        </div>
    </form>
</div>
