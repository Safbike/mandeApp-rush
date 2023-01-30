export default function ContentRec(props){
  return(
    <div id="inicioRec" style={{
        backgroundColor: props.bgcolor,
      }}>
    {props.title} <br/> {props.contenido}
    </div>
  )
}
