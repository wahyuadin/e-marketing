@foreach ($data as $datas)
<div class="modal fade" id="editData{{ $datas->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{ route('dokter.update', $datas->id) }}" method="POST" class="needs-validation" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Update Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="dokter" class="form-label">Nama Dokter <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="dokter" id="dokter" required
                                    value="{{ old('dokter', $datas->dokter) }}" placeholder="Masukan Nama Dokter">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Spesialis <span class="text-danger">*</span></label>
                                @php
                                    $spesialis = App\Models\Spesialis::all();
                                @endphp
                                <select name="spesialis_id" class="form-select">
                                    <option selected disabled>== Pilih Spesialis ==</option>
                                    @foreach ($spesialis as $item)
                                        <option value="{{ $item->id }}" {{ $datas->spesialis_id == $item->id ? 'selected' : '' }}>{{ $item->spesialis }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
  </div>
@endforeach
