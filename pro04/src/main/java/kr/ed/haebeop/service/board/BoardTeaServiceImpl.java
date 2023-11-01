package kr.ed.haebeop.service.board;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.Report;
import kr.ed.haebeop.repository.BoardTeaRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardTeaServiceImpl implements BoardService{

    @Autowired
    private BoardTeaRepositoryImpl boardTeaRepository;

    @Override
    public List<Board> boardList() throws Exception {
        return boardTeaRepository.boardList();
    }

    @Override
    public Board boardDetail(int bno) throws Exception {
        return boardTeaRepository.boardDetail(bno);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardTeaRepository.boardInsert(dto);
    }

    @Override
    public void boardDelete(int bno) throws Exception {
        boardTeaRepository.boardDelete(bno);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardTeaRepository.boardEdit(dto);
    }

    @Override
    public void countUp(int bno) throws Exception {

    }

    @Override
    public List<Board> commentList(int bno) throws Exception {
        return boardTeaRepository.commentList(bno);
    }

    @Override
    public void commentInsert(Board dto) throws Exception {
        boardTeaRepository.commentInsert(dto);
    }

    @Override
    public void commentDeleteAll(int bno) throws Exception {
        boardTeaRepository.commentDeleteAll(bno);
    }
    @Override
    public List<Board> allCommentList() throws Exception {
        return boardTeaRepository.allCommentList();
    }
    @Override
    public void reportBoard(Report report) throws Exception {
        boardTeaRepository.reportBoard(report);
    }
    @Override
    public int checkReported(Report report) throws Exception {
        return boardTeaRepository.checkReported(report);
    }
    @Override
    public List<Board> boardReportList() throws Exception {
        return boardTeaRepository.boardReportList();
    }
    @Override
    public List<Board> recentReportList() throws Exception {
        return boardTeaRepository.recentReportList();
    }
}
