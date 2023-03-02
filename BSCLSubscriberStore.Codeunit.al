codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnDeleteBookErr: Label 'The %1 cannot be deleted, because it is liked by one or mor Customer(s)';

    //     ==> Können wir auch direkt in der Customer-Tableextension lösen!
    //     [EventSubscriber(ObjectType::Table, Database::"Customer", 'OnAfterValidateEvent', 'BSB Favorite Book No.', true, true)]
    //     local procedure CustOnAfterValidateBSBFavBookNo(var Rec: Record Customer; var xRec: Record Customer)
    //     begin
    //         if Rec."BSB Favorite Book No." <> xRec."BSB Favorite Book No." then
    //             Rec.Modify();
    //     end;
    [EventSubscriber(ObjectType::Table, Database::"BSB Book", 'OnBeforeOnDelete', '', false, false)]
    local procedure OnBeforeOnDelete(var Rec: Record "BSB Book"; var IsHandled: Boolean);
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnDeleteBookErr, Rec.TableCaption);
        IsHandled := true;
    end;
}