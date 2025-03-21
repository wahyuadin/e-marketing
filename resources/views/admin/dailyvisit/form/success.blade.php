<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ ucwords(str_replace(' ', ' ', config('app.name'))) }} | {{ 'Daily Visit' }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body {
            background-color: #ccd1ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
            padding: 20px;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }

        .banner {
            width: 100%;
            height: 180px;
            background: url('{{ asset('assets/gedung.jpg') }}') center/cover no-repeat;
            border-radius: 12px 12px 0 0;
        }

        h1 {
            font-size: 1.8rem;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
            color: #333;
        }

        .form-label {
            font-weight: 600;
            color: #444;
        }

        .form-control,
        .form-select {
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: all 0.3s;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .select2-container .select2-selection--single {
            height: 38px;
            border-radius: 8px;
            border: 1px solid #ccc;
            display: flex;
            align-items: center;
            padding: 5px;
        }

        .select2-container .select2-selection--single .select2-selection__rendered {
            padding-left: 10px;
            color: #555;
        }

        .select2-container .select2-selection--single .select2-selection__arrow {
            height: 100%;
            right: 10px;
        }
    </style>
</head>

<body>
    <div class="form-container">
        <div class="banner"></div>
        <h1>Terima Kasih!</h1>
        <h5 class="text-center text-muted">Formulir Anda telah berhasil dikirim.</h5>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

</body>

</html>
