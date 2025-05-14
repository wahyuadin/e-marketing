@extends('template.app')
@section('content')
    <div id="loading-overlay" class="d-none"
        style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.8); z-index: 9999; display: flex; align-items: center; justify-content: center;">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
    <!-- Start of Selection -->
    <div class="container mt-4">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Approval History</h5>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                    <div class="mt-3 mb-4">
                        <button type="button" class="btn btn-secondary" onclick="exportExcel()">
                            <i class="fa-solid fa-download"></i> Download
                        </button>
                    </div>
                    <table id="example" class="table table-striped table-bordered w-100 mt-3">
                        @include('alert')
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Tanggal</th>
                                <th>Pengaju</th>
                                <th>Dokter</th>
                                <th>Spesialis</th>
                                <th>Instansi</th>
                                <th>Alamat Praktek</th>
                                <th>Alamat Rumah</th>
                                <th>No Hp</th>
                                <th>Cabang</th>
                                <th>Area</th>
                                <th>Email</th>
                                <th>AM</th>
                                <th>Bank 1</th>
                                <th>Bank 2</th>
                                <th>Bank 3</th>
                                <th>Rekening 1</th>
                                <th>Rekening 2</th>
                                <th>Rekening 3</th>
                                <th>Atas Nama 1</th>
                                <th>Atas Nama 2</th>
                                <th>Atas Nama 3</th>
                                <th>Appoval 1</th>
                                <th>Appoval 2</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $index => $datas)
                                <tr>
                                    <td>{{ $index + 1 }}</td>
                                    <td>{{ $datas->created_at ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->user->nama ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->dokter ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->spesialis->spesialis ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->instansi->instansi ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->alamat_praktek ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->alamat_rumah ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->no_hp ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->wilayah->wilayah ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->area ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->email ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->wilayah->user->nama ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->bank_1 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->bank_2 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->bank_3 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->rekening_1 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->rekening_2 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->rekening_3 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->atas_nama_1 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->atas_nama_2 ?? '-' }}</td>
                                    <td>{{ $datas->pengajuan_dokter->atas_nama_3 ?? '-' }}</td>
                                    {{-- Approval 1 --}}
                                    <td>
                                        @if ($datas->status_appoval_1 == 'approved')
                                            <i class='bx bx-check text-success'></i> Disetujui oleh
                                            <b>{{ ucwords($datas->appoval_1 ?? '-') }}</b>
                                        @elseif ($datas->status_appoval_1 == 'rejected')
                                            <i class='bx bx-x text-danger'></i> Ditolak oleh
                                            <b> {{ ucwords($datas->appoval_1 ?? '-') }}</b>
                                        @else
                                            Menunggu persetujuan <b>{{ $datas->appoval_1 ?? '-' }}</b>, Status:
                                            <b>{{ ucwords($datas->status_appoval_1 ?? 'pending') }}</b>
                                        @endif
                                    </td>

                                    {{-- Approval 2 --}}
                                    <td>
                                        @if ($datas->status_appoval_2 == 'approved')
                                            <i class='bx bx-check text-success'></i> Disetujui oleh
                                            <b>{{ ucwords($datas->appoval_2 ?? '-') }}</b>
                                        @elseif ($datas->status_appoval_2 == 'rejected')
                                            <i class='bx bx-x text-danger'></i> Ditolak oleh
                                            <b>{{ ucwords($datas->appoval_2 ?? '-') }}</b>
                                        @else
                                            Menunggu persetujuan <b>{{ $datas->appoval_2 ?? '-' }}</b>, Status:
                                            <b>{{ ucwords($datas->status_appoval_2 ?? 'pending') }}</b>
                                        @endif
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @push('style')
        {{-- datatable --}}
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap5.css">
    @endpush

    @push('scripts')
        {{-- Datatable --}}
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap5.js"></script>

        {{-- excel pdf --}}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
        <script>
            new DataTable('#example');

            function printPDF() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                const {
                    jsPDF
                } = window.jspdf;
                let doc = new jsPDF('landscape'); // Menambahkan 'landscape' di sini

                let title = "DATA PENGAJUAN DOKTER E-REPORTING PT SOLAS LANGGENG SEJAHTERA";
                let pageWidth = doc.internal.pageSize.width;
                let titleWidth = doc.getTextWidth(title);
                doc.text(title, (pageWidth - titleWidth) / 2, 10);

                let table = $('#example').DataTable();
                let headers = [];
                $('#example thead th').each(function() {
                    headers.push($(this).text().trim());
                });
                headers.splice(); // Menghapus kolom terakhir jika perlu

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node();
                    let rowData = [];
                    $(row).find('td').each(function() {
                        let cleanText = $(this).text().replace(/\s+/g, ' ').trim();
                        rowData.push(cleanText);
                    });
                    rowData.splice(); // Menghapus kolom terakhir jika perlu
                    data.push(rowData);
                });

                doc.autoTable({
                    head: [headers],
                    body: data,
                    startY: 20,
                    theme: "striped",
                    styles: {
                        fontSize: 8,
                        textColor: [0, 0, 0]
                    },
                    headStyles: {
                        fillColor: [192, 192, 192],
                        textColor: [0, 0, 0]
                    },
                });

                doc.save("approval-history.pdf");
                document.getElementById('loading-overlay').classList.add('d-none');
            }

            function exportExcel() {
                document.getElementById('loading-overlay').classList.remove('d-none');

                let table = $('#example').DataTable();
                let headers = [];
                $('#example thead th').each(function() {
                    headers.push($(this).text().trim());
                });
                headers.splice(); // Menghapus kolom terakhir jika perlu

                let data = [];
                table.rows({
                    search: 'applied'
                }).every(function() {
                    let row = this.node();
                    let rowData = [];
                    $(row).find('td').each(function() {
                        let cleanText = $(this).text().replace(/\s+/g, ' ').trim();
                        rowData.push(cleanText);
                    });
                    rowData.splice(); // Menghapus kolom terakhir jika perlu
                    data.push(rowData);
                });

                let ws_data = [headers, ...data];
                let ws = XLSX.utils.aoa_to_sheet(ws_data);

                let colWidths = ws_data[0].map((_, colIndex) => {
                    let maxWidth = 10;
                    ws_data.forEach(row => {
                        let cell = row[colIndex];
                        if (cell && cell.length > maxWidth) {
                            maxWidth = cell.length;
                        }
                    });
                    return {
                        wch: maxWidth + 2
                    };
                });
                ws['!cols'] = colWidths;

                let wb = XLSX.utils.book_new();
                XLSX.utils.book_append_sheet(wb, ws, "Approval History");

                XLSX.writeFile(wb, "approval-history.xlsx");
                document.getElementById('loading-overlay').classList.add('d-none');
            }
        </script>
    @endpush
@endsection
