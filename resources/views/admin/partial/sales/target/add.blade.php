<div class="modal-content">
    <form action="{{ route('sales.target.store') }}" method="POST" class="needs-validation" enctype="multipart/form-data">
        @csrf
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">{{ $title }}</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="mb-3">
                <div class="mb-3 mt-3">
                    <label for="nama_target" class="form-label">Nama Target <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="nama_target" id="nama_target" required
                        value="{{ old('nama_target') }}" placeholder="Masukan Nama Target">
                </div>
            </div>
            <div class="mb-3">
                <div class="mb-3 mt-3">
                    <label for="nominal" class="form-label">Nominal Target <span class="text-danger">*</span></label>
                    <input type="number" class="form-control" name="nominal" id="nominal" required
                        value="{{ old('nominal') }}" placeholder="Masukan Nominal Target">
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" id="submitButtonPost" class="btn btn-primary">Save changes</button>
        </div>
    </form>
</div>
