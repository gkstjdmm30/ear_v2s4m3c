<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>화면 설계 1차 임한성</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
  <H1>화면 설계 기초 예제</H1>
<form id='frm'><Div class='all_1'>
  <div>
    Text : <input type = 'text' value='textBox'>
  </div>
  <div>
    Number : <input type = 'number' value='0'>
   </div>
   <div>
    TextArea : <textarea rows="3" cols="20">TextArea</textarea>
  </div>
  <div>
    Select : <select>
      <option>Option1</option>
      <option>Option2</option>
    </select>
  </div>
  <div>
    Radio : <input type ="radio" > <input type ="radio" checked="checked" > <input type ="radio" > 
  </div>
  <div>
    CheckBox : <input type = "checkbox"> <input type = "checkbox"> <input type = "checkbox" checked="checked">
  </div>
    <table class='table'>
      Table : 
      <colgroup>
        <col width="20px" />
        <col width="100px" />
        <col width="30px" />
      </colgroup>
      <thead>
        <tr>
          <th class='t_1'>thead</th>
          <td class='t_1'>Thead1</td>
          <td class='t_1'>Thead2</td>
        </tr>      
      </thead>
      <tbody>
        <tr>
          <th class='t_1'>tbody</th>
          <td class='t_1'>tbody1</td>
          <td class='t_1'>tboyd2</td>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <th class='t_1'>tfoot</th>
          <td class='t_1'>tfoot1</td>
          <td class='t_1'>tfoot2</td>
        </tr>
      </tfoot>
    </table>
    YouTube : <iframe width="508" height="286" src="https://www.youtube.com/embed/iP6XpLQM2Cs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </Div>    
</form>
</body>
</html>