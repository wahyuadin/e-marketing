<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed  layout-menu-fixed   customizer-hide layout-wide"
    dir="ltr" data-theme="theme-default" data-assets-path="/sneat-html-django-admin-template/demo-1/static/"
    data-base-url="" data-framework="django" data-template="vertical-menu--theme-default-light">

<head>
    <title>{{ config('app.name') . ' | Halaman Login' }}</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <meta name="description"
        content="Sneat is a modern, clean and fully responsive admin template built with Bootstrap 5, Django, HTML, CSS, and JavaScript. It has a huge collection of reusable UI components. It can be used for all types of web applications like custom admin panel, project management system, admin dashboard, Backend application or CRM." />
    <meta name="keywords"
        content="django, django admin, dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5" />
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://solas.id/">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('assets/logo.jpg') }}" />

    <!-- Include the styles partial -->


    <!--Fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">

    <!-- Icons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="{{ asset('assets/css/fontawesome.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/flag-icons.css') }}" />

    <!--Core CSS -->

    <link rel="stylesheet" href="{{ asset('assets/css/core.css') }}" class="template-customizer-core-css" />
    <link rel="stylesheet" href="{{ asset('assets/css/theme-default.css') }}" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="{{ asset('assets/css/demo2.css') }}" />

    <!--Vendor CSS-->
    <link rel="stylesheet" href="{{ asset('assets/css/perfect-scrollbar.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/typeahead.css') }}" />

    <link rel="stylesheet" href="{{ asset('assets/css/form-validation.css') }}" />

    <link rel="stylesheet" href="{{ asset('assets/css/page-auth.css') }}" />
    <!-- Helpers -->
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <script src="{{ asset('assets/js/helpers.js') }}"></script>
    <!--? Template customizer: To hide customizer set display_customizer value false in config.js.  -->

    <script src="{{ asset('assets/css/template-customizer.js') }}"></script>

    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="{{ asset('assets/css/config.js') }}"></script>
    <!-- beautify ignore:start -->

</head>

<body>
    @php
    $rememberDeviceDecoded = isset($rememberDevice) ? json_decode($rememberDevice) : null;
    @endphp
    @include('sweetalert::alert')
    <div class="authentication-wrapper authentication-cover">
        <!-- Logo -->
        <a class="app-brand auth-cover-brand gap-2">
            <span class="app-brand-logo demo"></span>
            <img src="{{ asset('assets/logo.png') }}" alt="Brand Logo" class="logo-icon me-2">
            </span>
        </a>
        <!-- /Logo -->
        <div class="authentication-inner row m-0">
            <!-- /Left Text -->
            <div class="d-none d-lg-flex col-lg-7 col-xl-8 align-items-center p-5">
                <div class="w-100 d-flex justify-content-center">
                    <img src="{{ asset('assets/gedung.jpg') }}" class="img-fluid" alt="Login image" width="1200">
                </div>
            </div>
            <!-- /Left Text -->

            <!-- Login -->
            <div class="d-flex col-12 col-lg-5 col-xl-4 align-items-center authentication-bg p-sm-12 p-6">
                <div class="w-px-400 mx-auto mt-12 pt-5">
                    <h4 class="mb-1">E-Reporting</h4>
                    <p class="mb-6">PT. SOLAS LANGGENG SEJAHTERA</p>
                    <p class="text-medium-emphasis">Silahkan Login</p>

                    <form class="mb-6" action="{{ url('/') }}" method="POST">
                        @csrf
                        <div class="mb-6">
                            <label for="nip" class="form-label">NIP</label>

                            <input type="number" class="form-control" name="nip" placeholder="Masukan NIP" value="{{ $rememberDeviceDecoded ? $rememberDeviceDecoded->nip : '' }}" autofocus>
                            @if ($errors->has('nip'))
                            <div class="text-danger">
                                {{ $errors->first('nip') }}
                            </div>
                            @endif
                        </div>
                        <div class="mb-6 form-password-toggle">
                            <label class="form-label" for="password">Password</label>
                            <div class="input-group input-group-merge">
                                <input type="password" class="form-control" name="password" value="{{ $rememberDeviceDecoded ? $rememberDeviceDecoded->password : '' }}" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="password" />
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                            @if ($errors->has('nip'))
                            <div class="text-danger">{{ $errors->first('password') }}</div>
                            @endif
                        </div>
                        <div class="my-8">
                            <div class="d-flex justify-content-between">
                                <div class="form-check mb-0 ms-2">
                                    <input class="form-check-input" type="checkbox" value="1" name="remember_device" {{ $rememberDevice ? 'checked' : '' }} />
                                    <label class="form-check-label" for="remember-me"> Simpan data </label>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary d-grid w-100">
                            Login
                        </button>
                    </form>
                </div>
            </div>
            <!-- /Login -->
        </div>
    </div>

    <!-- Content: End -->
    <!--Core Javascript-->
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/jquery/jquery.js">
    </script>
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/popper/popper.js">
    </script>
    <script src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/js/bootstrap.js">
    </script>
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/perfect-scrollbar/perfect-scrollbar.js">
    </script>
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/hammer/hammer.js">
    </script>
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/typeahead-js/typeahead.js">
    </script>
    <script src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/js/menu.js">
    </script>
    <script src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/js/main.js"></script>


    <!--Vendors Javascript-->


    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/%40form-validation/popular.js">
    </script>
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/%40form-validation/bootstrap5.js">
    </script>
    <script
        src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/vendor/libs/%40form-validation/auto-focus.js">
    </script>


    <!--Page Javascript-->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.querySelector('.form-password-toggle .input-group-text');
            const passwordInput = document.querySelector('.form-password-toggle input');

            togglePassword.addEventListener('click', function() {
                const isPassword = passwordInput.getAttribute('type') === 'password';
                passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
                this.querySelector('i').classList.toggle('bx-hide');
                this.querySelector('i').classList.toggle('bx-show');
            });
        });
    </script>


    <script src="https://demos.themeselection.com/sneat-html-django-admin-template/demo-1/static/js/pages-auth.js"></script>


</body>

</html>