package swdo.syj.yayoung.dao;

import java.util.ArrayList;
import java.util.HashMap;

import swdo.syj.yayoung.vo.NoteVO;

public interface NoteMapper {

	public int createNote(HashMap<String, String> map);

	public ArrayList<NoteVO> getNoteList(String st_id);

	public NoteVO noteDetail(int note_num);

	public int noteUpdate(NoteVO vo);

	public int deleteNote(int note_num);

	
	
}
