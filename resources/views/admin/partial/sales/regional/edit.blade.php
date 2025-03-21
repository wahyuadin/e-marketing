<div class="modal-content">
    <form action="{{ route('regional-data.update', $data->id) }}" method="POST" class="needs-validation" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">{{ $title }}</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="mb-3">
                <label for="nama_regional" class="form-label">Nama Regional <span class="text-danger">*</span></label>
                <input type="text" class="form-control" name="nama_regional" id="nama_regional" required
                    value="{{ $data->nama_regional }}" placeholder="Masukan Nama Regional">
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>
