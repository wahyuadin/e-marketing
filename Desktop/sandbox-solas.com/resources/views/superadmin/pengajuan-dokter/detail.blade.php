<style>
    ul.timeline-3 {
        list-style-type: none;
        position: relative;
    }

    ul.timeline-3:before {
        content: " ";
        background: #d4d9df;
        display: inline-block;
        position: absolute;
        left: 29px;
        width: 2px;
        height: 100%;
        z-index: 400;
    }

    ul.timeline-3>li {
        margin: 20px 0;
        padding-left: 20px;
    }

    ul.timeline-3>li:before {
        content: " ";
        background: white;
        display: inline-block;
        position: absolute;
        border-radius: 50%;
        border: 3px solid #E7E7FF;
        left: 20px;
        width: 20px;
        height: 20px;
        z-index: 400;
    }
</style>
@foreach ($data as $datas)
    <div class="modal fade" id="detailData{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detail">Detail Pengajuan Dokter
                        <b>{{ ucwords($datas->dokter ?? '-') }}</b>
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">Dokter</label>
                                <input type="text" class="form-control" name="dokter" value="{{ $datas->dokter }}"
                                    disabled>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Spesialis</label>
                                <input type="text" class="form-control"
                                    value="{{ $datas->spesialis->spesialis ?? '-' }}" disabled>
                            </div>
                        </div>

                        <div class="col md-6">
                            <div class="mb-3">
                                <label class="form-label">Area</label>
                                <input type="text" class="form-control" value="{{ $datas->area ?? '-' }}" disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Cabang</label>
                                <input type="text" class="form-control" value="{{ $datas->wilayah->wilayah ?? '-' }}"
                                    disabled>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Outlet</label>
                                <input type="text" class="form-control"
                                    value="{{ $datas->instansi->instansi ?? '-' }}" required disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" class="form-control" value="{{ $datas->email }}" required
                                    disabled>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">No Telp (WhatsApp)</label>
                                <input type="text" class="form-control" value="{{ $datas->no_hp }}" required
                                    disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat Rumah <span
                                        class="text-danger">*</span></label>
                                <textarea class="form-control" rows="5" disabled>{{ $datas->alamat_rumah }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat Praktek <span
                                        class="text-danger">*</span></label>
                                <textarea class="form-control" rows="5" disabled>{{ $datas->alamat_praktek }}</textarea>
                            </div>
                        </div>
                        <hr>
                        <h5>Informasi Rekening</h5>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="bank_1" class="form-label">Bank 1</label>
                                <input type="text" class="form-control" name="bank_1" id="bank_1"
                                    value="{{ $datas->bank_1 }}" placeholder="Masukkan Nama Bank" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="rekening_1" class="form-label">Nomor Rekening</label>
                                <input type="number" class="form-control" name="rekening_1" id="rekening_1"
                                    value="{{ $datas->rekening_1 }}" placeholder="Masukkan No Rekening" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="atas_nama_1" class="form-label">A/n </label>
                                <input type="text" class="form-control" name="atas_nama_1" required
                                    value="{{ $datas->atas_nama_1 }}" placeholder="Atas Nama .." disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="bank_2" class="form-label">Bank 2 </label>
                                <input type="text" class="form-control" name="bank_2" id="bank_2" required
                                    value="{{ $datas->bank_2 }}" placeholder="Masukkan Nama Bank" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="rekening_2" class="form-label">Nomor Rekening </label>
                                <input type="number" class="form-control" name="rekening_2" id="rekening_2"
                                    required value="{{ $datas->rekening_2 }}" placeholder="Masukkan No Rekening"
                                    disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="atas_nama_2" class="form-label">A/n </label>
                                <input type="text" class="form-control" name="atas_nama_2" id="atas_nama_2"
                                    required value="{{ $datas->atas_nama_2 }}" placeholder="Atas Nama .." disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="bank_3" class="form-label">Bank 3 <span
                                        class="text-primary">*</span></label>
                                <input type="text" class="form-control" name="bank_3" id="bank_3" required
                                    value="{{ $datas->bank_3 }}" placeholder="Masukkan Nama Bank" disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="rekening_3" class="form-label">Nomor Rekening </label>
                                <input type="number" class="form-control" name="rekening_3" id="rekening_3"
                                    required value="{{ $datas->rekening_3 }}" placeholder="Masukkan No Rekening"
                                    disabled>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="atas_nama_3" class="form-label">A/n </label>
                                <input type="text" class="form-control" name="atas_nama_3" id="atas_nama_3"
                                    required value="{{ $datas->atas_nama_3 }}" placeholder="Atas Nama .." disabled>
                            </div>
                        </div>
                        <hr>
                        <div class="col-md-12 mt-4">
                            <h5>Appooval History</h5>
                            <ul class="timeline-3">
                                <li>
                                    <a href="#!" style="font-size: 17px">Approver 1 :
                                        <b>{{ $datas->approvalHistory->last()->appoval_1 ?? '-' }}</b><br>
                                        <small>Status :
                                            <b>{{ $datas->approvalHistory->last()->status_appoval_1 ?? '-' }}</b></small>
                                        <p class="mt-2">Date:
                                            {{ \Carbon\Carbon::parse($datas->approvalHistory->last()->created_at)->format('d-m-Y H:i') }}
                                            WIB
                                        </p>
                                        @if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin')
                                            <div class="d-flex">
                                                <form action="{{ route('approve', $datas->id) }}" method="post"
                                                    class="me-2">
                                                    @csrf
                                                    <input type="text" name="appoval_1"
                                                        value="{{ Auth::user()->nama ?? '-' }}" hidden>
                                                    <input type="text" name="appoval_2"
                                                        value="{{ $datas->approvalHistory->last()->appoval_2 ?? '-' }}"
                                                        hidden>
                                                    <input type="text" name="status_appoval_1" value="approved"
                                                        hidden>
                                                    <input type="text" name="status_appoval_2"
                                                        value="{{ $datas->approvalHistory->last()->status_appoval_2 ?? '-' }}"
                                                        hidden>
                                                    <button type="submit"
                                                        class="btn btn-success btn-sm">Approve</button>
                                                </form>

                                                <form action="{{ route('approve', $datas->id) }}" method="post">
                                                    @csrf
                                                    <input type="text" name="appoval_1"
                                                        value="{{ Auth::user()->nama ?? '-' }}" hidden>
                                                    <input type="text" name="appoval_2"
                                                        value="{{ $datas->approvalHistory->last()->appoval_2 }}"
                                                        hidden>
                                                    <input type="text" name="status_appoval_1" value="rejected"
                                                        hidden>
                                                    <input type="text" name="status_appoval_2"
                                                        value="{{ $datas->approvalHistory->last()->status_appoval_2 }}"
                                                        hidden>
                                                    <button type="submit"
                                                        class="btn btn-danger btn-sm">Reject</button>
                                                </form>
                                            </div>
                                        @endif
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" style="font-size: 17px">Approver 2 :
                                        <b>{{ $datas->approvalHistory->last()->appoval_2 ?? '-' }}</b></a><br>
                                    <small>Status :
                                        <b>{{ $datas->approvalHistory->last()->status_appoval_2 ?? '-' }}</b></small>
                                    <p class="mt-2">Date:
                                        {{ \Carbon\Carbon::parse($datas->created_at)->format('d-m-Y H:i') }} WIB
                                    </p>
                                    @if (Auth::user()->nama == $datas->approvalHistory->last()->appoval_2)
                                        <div class="d-flex">
                                            <form action="{{ route('approve', $datas->id) }}" method="post"
                                                class="me-2">
                                                @csrf
                                                <input type="text" name="appoval_1"
                                                    value="{{ $datas->approvalHistory->last()->appoval_1 }}" hidden>
                                                <input type="text" name="appoval_2"
                                                    value="{{ Auth::user()->nama }}" hidden>
                                                <input type="text" name="status_appoval_1"
                                                    value="{{ $datas->approvalHistory->last()->status_appoval_1 }}"
                                                    hidden>
                                                <input type="text" name="status_appoval_2" value="approved"
                                                    hidden>
                                                <button type="submit" class="btn btn-success btn-sm">Approve</button>
                                            </form>

                                            <form action="{{ route('approve', $datas->id) }}" method="post">
                                                @csrf
                                                <input type="text" name="appoval_1"
                                                    value="{{ $datas->approvalHistory->last()->appoval_1 }}" hidden>
                                                <input type="text" name="appoval_2"
                                                    value="{{ Auth::user()->nama }}" hidden>
                                                <input type="text" name="status_appoval_1"
                                                    value="{{ $datas->approvalHistory->last()->status_appoval_1 }}"
                                                    hidden>
                                                <input type="text" name="status_appoval_2" value="rejected"
                                                    hidden>
                                                <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                            </form>
                                        </div>
                                    @endif
                                </li>
                            </ul>
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
