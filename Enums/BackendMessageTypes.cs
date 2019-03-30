namespace PgMaskingProxy.Enums
{
    public enum BackEndMessageType
    {
        Authentication = (int)'R',
        BackendKeyData = (int)'K',
        BindComplete = (int)'2',
        CloseComplete = (int)'3',
        CommandComplete = (int)'C',
        CopyInResponse = (int)'G',
        CopyOutResponse = (int)'H',
        CopyBothResponse = (int)'W',
        DataRow = (int)'D',
        EmptyResponse = (int)'I',
        ErrorResponse = (int)'E',
        FunctionCallResponse = (int)'V',
        NegotiateProtocolVersion = (int)'v',
        NoData = (int)'n',
        NoticeResponse = (int)'N',
        NotificationResponse = (int)'A',
        ParameterDescription = (int)'t',
        ParameterStatus = (int)'S',
        ParseComplete = (int)'1',
        PortalSuspended = (int)'s',
        ReadyForQuery = (int)'Z',
        RowDescription  = (int)'T',
        Unknown = -1 //not part of protocol. we use it in case we don't recognize something.
    }
}
