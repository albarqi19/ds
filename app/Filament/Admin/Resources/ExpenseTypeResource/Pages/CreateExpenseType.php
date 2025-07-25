<?php

namespace App\Filament\Admin\Resources\ExpenseTypeResource\Pages;

use App\Filament\Admin\Resources\ExpenseTypeResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateExpenseType extends CreateRecord
{
    protected static string $resource = ExpenseTypeResource::class;
}
