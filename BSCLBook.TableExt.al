tableextension 50200 "BSCL Book" extends "BSB Book"
{
    fields
    {
        field(50200; "BSCL No. of Customer Likes"; Integer)
        {
            Caption = 'No. of Customer Likes';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count(Customer where("BSB Favorite Book No." = field("No.")));
        }

    }

    // Hat nicht zum erfolg geführt, da das löschen in der 
    // BSB Book Tabelle generell unterbunden wird
    // trigger OnBeforeDelete()
    // var
    //     Customer: Record Customer;
    // begin
    //     // CalcFields("BSCL No. of Customer Likes");
    //     // if "BSCL No. of Customer Likes" > 0 then
    //     //     Error(OnDeleteBookErr, TableCaption);

    //     Customer.SetRange("BSB Favorite Book No.", "No.");
    //     if not Customer.IsEmpty then
    //         Error(OnDeleteBookErr, TableCaption);
    // end;

    // var
    //     OnDeleteBookErr: Label 'The %1 cannot be deleted, because it is liked by one or mor Customer(s)';
}