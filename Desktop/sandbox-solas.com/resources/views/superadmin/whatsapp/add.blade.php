<div class="modal fade" id="addData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('whatsapp.store') }}" method="POST" class="needs-validation"
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
                                <label for="dokter" class="form-label">Nama <span class="text-danger">*</span></label>
                                <input type="text" value="{{ old('nama') }}" name="nama" class="form-control"
                                    placeholder="Nama .. ">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">Session / Token API <span
                                        class="text-danger">*</span></label>
                                <input type="text" value="{{ old('session') }}" name="session" class="form-control"
                                    placeholder="Session Whatsapp Token .. ">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">No Telp <span
                                        class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">ID (+62)</span>
                                    <input type="text" name="no_hp"
                                        value="{{ old('no_hp', $userData->no_hp ?? '') }}"
                                        class="form-control phone-number-otp-mask" placeholder="202 555 0111" required>
                                </div>
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
