
<script type="text/javascript">
function validation()
{
	if(document.form.book_name.value=='')
	{
			alert('Please filled in the book name');
			document.form.book_name.focus();
			return false;
	}
	else if(document.form.auther_name.value==''){
		alert('Please filled in the auther name');
		//document.form.author_name.focus();
		return false;
	}
	else if(document.form.quantity.value=='')
	{
		alert('Please filled in the quantity');
		document.form.quantity.focus();
		return false;
	}
	else if(document.form.edition.value=='')
	{
		alert('Please filled in the edition');
		document.form.edition.focus();
		return false;
	}
	else if(document.form.rack.value=='')
	{
		alert('Please filled in the rack');
		document.form.rack.focus();
		return false;
	}
	
return true;
}
</script>
