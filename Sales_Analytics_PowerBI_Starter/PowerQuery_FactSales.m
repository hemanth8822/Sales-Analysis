let
    Source = Csv.Document(File.Contents("C:\Data\Superstore_Clean.csv"),[Delimiter=",", Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders,{
        {"Row ID", Int64.Type}, {"Order ID", type text}, {"Order Date", type date}, {"Ship Date", type date},
        {"Ship Mode", type text}, {"Customer ID", type text}, {"Customer Name", type text}, {"Segment", type text},
        {"Country", type text}, {"City", type text}, {"State", type text}, {"Postal Code", type text}, {"Region", type text},
        {"Product ID", type text}, {"Category", type text}, {"Subcategory", type text}, {"Product Name", type text},
        {"Sales", Currency.Type}, {"Quantity", Int64.Type}, {"Discount", Percentage.Type}, {"Profit", Currency.Type}
    })
in
    ChangedTypes
