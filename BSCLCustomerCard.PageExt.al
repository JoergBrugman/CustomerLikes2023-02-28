pageextension 50201 "BSCL Customer Card" extends "Customer Card"
{
    actions
    {
        // addfirst(Promoted)
        addbefore(Contact_Promoted)
        {
            actionref(FavoriteBookCard_Promoted; "BSCL FavoriteBookCard") { }
        }
        addlast(navigation)
        {
            action("BSCL FavoriteBookCard")
            {
                Caption = 'Book Card';
                ApplicationArea = All;
                Image = Card;
                ToolTip = 'Executes the Book Card action.';
                Enabled = Rec."BSB Favorite Book No." <> '';
                // Promoted = true;
                // PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.ShowFavoriteBook();
                end;
            }
        }
    }
}