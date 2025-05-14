<div class="modal fade" id="profile{{ Auth::user()->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('profile.store') }}" method="POST" class="needs-validation"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Informasi Profile || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 border rounded p-4 shadow-sm">
                                <div class="mb-4 text-center">
                                    <img src="{{ asset('assets/profile/default.png') }}" alt="Profile Picture"
                                        class="rounded-circle img-fluid border"
                                        style="width: 160px; height: 160px; object-fit: cover; border: 4px solid #fff;">
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 mb-3">
                                        <label class="labels">NIP</label>
                                        <input type="text" class="form-control" placeholder="Name"
                                            value="{{ Auth::user()->nip }}" disabled>
                                    </div>
                                    <div class="col-sm-12 col-md-6 mb-3">
                                        <label class="labels">Nama</label>
                                        <input type="text" class="form-control" placeholder="Username"
                                            value="{{ Auth::user()->nama }}" disabled>
                                    </div>
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="labels">Role</label>
                                        <input type="text" class="form-control" placeholder="Enter phone number"
                                            value="{{ ucwords(Auth::user()->role ?? 'Data Tidak Tersedia') }} "
                                            disabled>
                                    </div>
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="labels">Regional</label>
                                        <input type="text" class="form-control" placeholder="Enter phone number"
                                            value="{{ Auth::user()->alamat ?? 'Data Tidak Tersedia' }} " disabled>
                                    </div>
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="labels">Daerah</label>
                                        <input type="text" class="form-control" placeholder="Enter address line 1"
                                            value="{{ Auth::user()->email ?? 'Data Tidak Tersedia' }}" disabled>
                                    </div>
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="labels">No Telepon (WhatsApp) <span
                                                class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text">ID (+62)</span>
                                            <input type="text" name="no_hp" value="{{ old('no_hp' ?? '') }}"
                                                class="form-control phone-number-otp-mask" placeholder="202 555 0111"
                                                required>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 mb-3">
                                        <label class="labels">Email <span class="text-danger">*</span></label>
                                        <input type="email" name="email" class="form-control"
                                            placeholder="Enter email" value="{{ old('email' ?? '') }}" required>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label class="labels">Alamat <span class="text-danger">*</span></label>
                                        <textarea name="alamat" class="form-control" rows="6" required>{{ old('alamat' ?? '') }}</textarea>
                                    </div>
                                </div>
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