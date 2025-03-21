<div class="modal-content">
    <form action="{{ route('sales.user.import') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">{{ $title }}</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="import_excel" class="form-label">Input File <span class="text-danger">*</span></label>
                    <input type="file" class="form-control" id="import_excel" name="import_excel" accept=".xlsx, .xls" required>
                    <small class="form-text text-muted">Format file yang diterima: .xlsx, .xls</small>

                    {{-- <p class="mt-2">Unduh template file <a href="#" target="_blank" download>di sini</a></p> --}}
                    <p class="mt-2">Unduh template file <a href="{{ asset('assets/template/Template.xlsx') }}" target="_blank" class="btn btn-primary btn-xs rounded"><i class='bx bxs-download'></i> Download</a></p>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">Tutup</button>
            <button type="submit" class="btn btn-info rounded-pill">Import</button>
        </div>
    </form>
</div>
