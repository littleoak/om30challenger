<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->group(function() {
    Route::apiResource(
        '/pacientes',
        \App\Http\Controllers\Api\PacientesController::class);
});

Route::post('/login', function (Request $request) {
    $credentials = $request->only(['email', 'password']);
    if(Auth::attempt($credentials) === false) {
        return response()->json('Unauthorized', 401);
    }

    $user = Auth::user();
    $user->tokens()->delete(); //revogar um token anterior
    //autorizações, padrão é ['*'] <--- pode tudo
    //$token = $user->createToken('token', ['pacientes:delete']); //se a gente for pensar em limitar o escopo
    $token = $user->createToken('token', ['*']); //escopo máximo
    return response()->json($token->plainTextToken);
});
