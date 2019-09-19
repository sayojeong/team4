package swdo.syj.yayoung.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import swdo.syj.yayoung.vo.NoteVO;

@Repository
public class NoteDao {

	@Autowired
	SqlSession session;

	public int createNote(HashMap<String, String> map) {
		NoteMapper mapper = session.getMapper(NoteMapper.class);
		int res = mapper.createNote(map);
		return res;
	}

	public ArrayList<NoteVO> getNoteList(String st_id) {
		NoteMapper mapper = session.getMapper(NoteMapper.class);
		ArrayList<NoteVO> list = mapper.getNoteList(st_id);
		return list;
	}

	public NoteVO noteDetail(int note_num) {
		NoteMapper mapper = session.getMapper(NoteMapper.class);
		NoteVO vo = mapper.noteDetail(note_num);
		return vo;
	}

	public int noteUpdate(NoteVO vo) {
		NoteMapper mapper = session.getMapper(NoteMapper.class);
		int res = mapper.noteUpdate(vo);
		return res;
	}

	public int deleteNote(int note_num) {
		NoteMapper mapper = session.getMapper(NoteMapper.class);
		int res = mapper.deleteNote(note_num);
		return res;
	}
	
	
}
