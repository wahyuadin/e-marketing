{{-- Make sure Bootstrap 5 CSS/JS and Bootstrap Icons CSS are included --}}
{{-- Example: <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"> --}}

@foreach ($data as $datas)
    <div class="modal fade" id="detailData{{ $datas->id }}" tabindex="-1"
        aria-labelledby="detailDataLabel{{ $datas->id }}" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-scrollable"> {{-- Added modal-dialog-scrollable for potentially long content --}}
            <div class="modal-content shadow-lg border-0"> {{-- Removed default border, added larger shadow --}}

                {{-- Modal Header (Sea Blue Theme) --}}
                <div class="modal-header  text-white">
                    <h1 class="modal-title fs-5" id="detailDataLabel{{ $datas->id }}">
                        <i class="bi bi-info-circle-fill me-2"></i> Detail Data || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                {{-- Modal Body --}}
                <div class="modal-body p-4 bg-light"> {{-- Lighter background for body --}}
                    <div class="row">
                        <div class="col-lg-12">

                            {{-- Doctor Details Card --}}
                            <div class="card mb-4 shadow-sm rounded-3 border-light"> {{-- Softer border, rounded --}}
                                <div class="card-header bg-white py-3"> {{-- White header, more padding --}}
                                    <h5 class="card-title text-info mb-0">
                                        <i class="bi bi-person-badge me-2"></i> Informasi Dokter
                                    </h5>
                                </div>
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <p><strong><i class="bi bi-person-fill text-muted me-2"></i>Dokter
                                                    :</strong> {{ $datas->dokter ?? '-' }}</p>
                                            <p><strong><i class="bi bi-geo-alt-fill text-muted me-2"></i>Wilayah
                                                    :</strong> {{ $datas->wilayah->wilayah ?? '-' }}</p>
                                            <p><strong><i class="bi bi-envelope-fill text-muted me-2"></i>Email
                                                    :</strong> {{ $datas->email ?? '-' }}</p>
                                            <p><strong><i class="bi bi-telephone-fill text-muted me-2"></i>No HP
                                                    :</strong> {{ $datas->no_hp ?? '-' }}</p>
                                            <p><strong><i class="bi bi-house-door-fill text-muted me-2"></i>Alamat Rumah
                                                    :</strong> {{ $datas->alamat_rumah ?? '-' }}</p>
                                            <p><strong><i class="bi bi-geo-fill text-muted me-2"></i>Alamat Praktek
                                                    :</strong> {{ $datas->alamat_praktek ?? '-' }}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong><i class="bi bi-building-fill text-muted me-2"></i>Cabang
                                                    :</strong> {{ $datas->instansi->instansi ?? '-' }}</p>
                                            <p><strong><i class="bi bi-pin-map-fill text-muted me-2"></i>Alamat
                                                    :</strong> {{ $datas->instansi->alamat ?? '-' }}</p>
                                            <p><strong><i class="bi bi-envelope-at-fill text-muted me-2"></i>Email
                                                    Cabang :</strong> {{ $datas->instansi->email ?? '-' }}</p>
                                            <p><strong><i
                                                        class="bi bi-telephone-inbound-fill text-muted me-2"></i>Cabang
                                                    Telp :</strong> {{ $datas->instansi->no_hp ?? '-' }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            {{-- Bank Details Card --}}
                            <div class="card shadow-sm rounded-3 border-light"> {{-- Softer border, rounded --}}
                                <div class="card-header bg-white py-3"> {{-- White header, more padding --}}
                                    <h5 class="card-title text-info mb-0">
                                        <i class="bi bi-bank me-2"></i> Informasi Bank
                                    </h5>
                                </div>
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-md-4 mb-3 mb-md-0">
                                            <p class="mb-1"><strong><i
                                                        class="bi bi-credit-card-fill text-muted me-2"></i>Bank 1
                                                    :</strong> {{ $datas->bank_1 ?? '-' }}</p>
                                            <p class="mb-1 ps-4"><strong>A/n :</strong>
                                                {{ $datas->atas_nama_1 ?? '-' }}
                                            </p>
                                            <p class="mb-0 ps-4"><strong>Rekening :</strong>
                                                {{ $datas->rekening_1 ?? '-' }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="mb-1"><strong><i
                                                        class="bi bi-credit-card-2-back-fill text-muted me-2"></i>Bank 2
                                                    :</strong> {{ $datas->bank_2 ?? '-' }}</p>
                                            <p class="mb-1 ps-4"><strong>A/n :</strong>
                                                {{ $datas->atas_nama_2 ?? '-' }}
                                                {{-- Removed A/n for Bank 2 as it wasn't in the original --}}
                                            <p class="mb-0 ps-4"><strong>Rekening :</strong>
                                                {{ $datas->rekening_2 ?? '-' }}</p>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="mb-1"><strong><i
                                                        class="bi bi-credit-card-2-back-fill text-muted me-2"></i>Bank 3
                                                    :</strong> {{ $datas->bank_3 ?? '-' }}</p>
                                            <p class="mb-1 ps-4"><strong>A/n :</strong>
                                                {{ $datas->atas_nama_3 ?? '-' }}
                                                {{-- Removed A/n for Bank 2 as it wasn't in the original --}}
                                            <p class="mb-0 ps-4"><strong>Rekening :</strong>
                                                {{ $datas->rekening_3 ?? '-' }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                {{-- Modal Footer --}}
                <div class="modal-footer bg-gradient bg-light border-top"> {{-- Lighter footer, top border for separation --}}
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle me-1"></i> Close
                    </button>
                </div>

            </div>
        </div>
    </div>
@endforeach
