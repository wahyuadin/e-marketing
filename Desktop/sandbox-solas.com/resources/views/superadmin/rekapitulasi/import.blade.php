<div class="modal fade" id="importData" tabindex="-1" aria-labelledby="importDataLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            {{-- @csrf di sini dihilangkan karena sudah ada di dalam form --}}
            <div class="modal-header">
                {{-- Judul modal dengan ID yang dirujuk oleh aria-labelledby --}}
                <h5 class="modal-title" id="importDataLabel">
                    <i class="bx bx-import bx-sm me-2 text-primary"></i>Import Data Master
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            {{-- Form dimulai di sini, membungkus modal-body dan modal-footer --}}
            <form action="" method="POST" enctype="multipart/form-data"> {{-- Ganti action dengan route Anda --}}
                @csrf
                <div class="modal-body">
                    {{-- Konten utama modal, tanpa lapisan card, row, col yang berlebihan --}}
                    <div class="alert alert-primary d-flex align-items-center" role="alert">
                        <i class="bx bx-info-circle bx-sm me-2"></i>
                        <div>
                            Pastikan file yang Anda unggah sesuai dengan format template yang disediakan.
                            Format yang didukung: <strong>XLSX, CSV</strong>.
                        </div>
                    </div>

                    <div class="mb-4 mt-4 text-center">
                        <a href="{{ asset('templates/template_import_master.xlsx') }}" {{-- Ganti path template Anda --}}
                            target="_blank" class="btn btn-info">
                            <i class="bx bxs-download bx-sm me-2"></i>Unduh Template Import
                        </a>
                        <p class="text-muted small mt-2">Klik tombol di atas untuk mengunduh contoh template.</p>
                    </div>

                    <hr class="my-4">

                    <div class="mb-3">
                        {{-- ID dan name untuk input file dibuat lebih spesifik untuk modal jika perlu --}}
                        <label for="fileImportModal" class="form-label fs-5">Pilih File</label>
                        <input class="form-control form-control-lg @error('file_import_modal') is-invalid @enderror"
                            type="file" id="fileImportModal" name="file_import_modal" {{-- Sesuaikan name jika perlu --}}
                            accept=".xlsx, .csv" required>
                        @error('file_import_modal')
                            {{-- Sesuaikan name jika perlu --}}
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <div class="form-text">Pilih file Excel (XLSX) atau CSV yang akan diimpor.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    {{-- Tombol diletakkan langsung di modal-footer --}}
                    <button type="button" data-bs-dismiss="modal" class="btn btn-secondary">
                        <i class="bx bx-x bx-sm me-1"></i>Tutup
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="bx bx-cloud-upload bx-sm me-1"></i>Mulai Proses Import
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- Style block Anda --}}
<style>
    .modal-title i.bx {
        /* Style untuk ikon di modal-title */
        vertical-align: middle;
    }

    /* Kustomisasi warna tombol info jika default Sneat kurang sesuai */
    .btn-info {
        background-color: #00A4CC !important;
        /* Contoh warna biru laut cerah */
        border-color: #00A4CC !important;
        color: #fff !important;
        /* Pastikan teks kontras */
    }

    .btn-info:hover {
        background-color: #008fad !important;
        /* Warna hover sedikit lebih gelap */
        border-color: #008fad !important;
    }

    /* Kustomisasi warna alert primary jika default Sneat kurang sesuai */
    .alert-primary {
        background-color: #E0F7FA !important;
        /* Biru muda laut untuk background alert */
        border-color: #B2EBF2 !important;
        /* Border yang serasi */
        color: #00796B !important;
        /* Warna teks yang kontras dan elegan */
    }

    .alert-primary .bx {
        /* Warna ikon di dalam alert-primary */
        color: #00796B !important;
    }

    /* Menambahkan sedikit padding pada modal-body jika dirasa perlu setelah menghilangkan card */
    /* #importData .modal-body {
        padding: 1.5rem;
    } */
</style>
