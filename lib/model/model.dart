class Message
{
  final String message;
  final String id;

  Message( this.message, this.id);
  factory Message.formjson(jsondate)
  {
    return Message(jsondate['message'],jsondate['id']);
  }

}