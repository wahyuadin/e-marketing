<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;
use Symfony\Component\HttpFoundation\Response;

class SesiTrue
{
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        if (!Auth::check()) {
            Alert::error('Gagal', 'Anda tidak dapat akses halaman ini');
            return redirect(route('store'));
        }

        foreach ($roles as $role) {
            if (Auth::user()->role == $role) {
                return $next($request);
            } else {
                Alert::error('Gagal', 'Anda tidak dapat akses halaman ini');
            }
        }
        Alert::error('Gagal', 'Anda tidak dapat akses halaman ini');
        return redirect()->route('dashboard-' . Auth::user()->role . '.index');
    }
}
