@foreach ($data as $datas)
    <div class="modal fade" id="detailData{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Detail Data Dokter || {{ config('app.name') }}
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Doctor Details Card -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h5 class="card-title">Informasi Dokter</h5>
                                </div>
                                <div class="card-body">
                                    <!-- Doctor Information -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p><strong>Dokter :</strong> {{ $datas->dokter ?? '-' }}</p>
                                            <p><strong>Wilayah :</strong> {{ $datas->wilayah->wilayah ?? '-' }}</p>
                                            <p><strong>Email :</strong> {{ $datas->email ?? '-' }}</p>
                                            <p><strong>Instagram :</strong> {{ $datas->instagram ?? '-' }}</p>
                                            <p><strong>No HP :</strong> {{ $datas->no_hp ?? '-' }}</p>
                                            <p><strong>Alamat Rumah :</strong> {{ $datas->alamat_rumah ?? '-' }}</p>
                                            <p><strong>Alamat Praktek :</strong> {{ $datas->alamat_praktek ?? '-' }}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p><strong>Instansi :</strong> {{ $datas->instansi->instansi ?? '-' }}</p>
                                            <p><strong>Alamat :</strong> {{ $datas->instansi->alamat ?? '-' }}</p>
                                            <p><strong>Email :</strong> {{ $datas->instansi->email ?? '-' }}</p>
                                            <p><strong>No HP :</strong> {{ $datas->instansi->no_hp ?? '-' }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Instansi Details Card -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h5 class="card-title">Informasi Bank</h5>
                                </div>
                                <div class="card-body">
                                    <p><strong>Bank 1 :</strong> {{ $datas->bank_1 ?? '-' }} (Rekening:
                                        {{ $datas->rekening_1 ?? '-' }})</p>
                                    <p><strong>Bank 2 :</strong> {{ $datas->bank_2 ?? '-' }} (Rekening:
                                        {{ $datas->rekening_2 ?? '-' }})</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary"
                        data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@endforeach
