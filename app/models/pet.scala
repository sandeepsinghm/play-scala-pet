package models

case class Pet( age: Int,
                 name: String,
                 sex: String,
                 active: Boolean)

object JsonFormats {
  import play.api.libs.json.Json

  // Generates Writes and Reads for Feed and Pet thanks to Json Macros
  implicit val petFormat = Json.format[Pet]
}