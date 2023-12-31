package kr.ed.haebeop.controller.board;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.Report;
import kr.ed.haebeop.service.board.BoardTeaServiceImpl;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/boardTea/*")
public class BoardTeaController {

    @Autowired
    private BoardTeaServiceImpl boardTeaService;

    @Autowired
    HttpSession session; // 세션 생성

    @GetMapping("list.do")		// board/list.do
    public String getBoardList(HttpServletResponse response, Model model) throws Exception {
        if(session.getAttribute("sid") != null &&("admin".equals(session.getAttribute("sid")) || 2 == (Integer) session.getAttribute("job"))) {
            List<Board> boardList = boardTeaService.boardList();
            model.addAttribute("boardList", boardList);
            return "/boardTea/boardList";
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 페이지는 선생님만 접근 가능합니다.');</script>");
            out.flush();
            return "/index";
        }
    }

    @GetMapping("detail.do")	// board/detail.do?bno=1
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardTeaService.boardDetail(bno);
        List<Board> comment = boardTeaService.commentList(bno);
        model.addAttribute("dto", dto);
        model.addAttribute("comment", comment);
        System.out.println(comment.toString());
        return "/boardTea/boardDetail";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/boardTea/boardInsert";
    }

    @PostMapping("insert.do")
    public String boardInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor((String) session.getAttribute("sid"));
        boardTeaService.boardInsert(dto);
        return "redirect:list.do";
    }

    @PostMapping("commentInsert.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setAuthor(request.getParameter("id"));
        dto.setBno(Integer.parseInt(request.getParameter("bno")));
        dto.setContent(request.getParameter("content"));
        boardTeaService.commentInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("delete.do")
    public String boardDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        boardTeaService.boardDelete(bno);
        boardTeaService.commentDeleteAll(bno);
        return "redirect:list.do";
    }

    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = boardTeaService.boardDetail(bno);
        model.addAttribute("dto", dto);
        return "/boardTea/boardEdit";
    }

    @PostMapping("edit.do")
    public String boardEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Board dto = new Board();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardTeaService.boardEdit(dto);
        return "redirect:list.do";
    }
    //게시글 신고 팝업 창
    @RequestMapping("reportPopup.do")
    public String reportPopup(HttpServletRequest request, Model model) throws Exception {
        return "/boardTea/reportPopup";
    }

    //팝업창에서 게시글 신고 버튼 눌렀을때 처리
    @RequestMapping(value = "report.do", method = RequestMethod.POST)
    public void report(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        int bno = Integer.parseInt(request.getParameter("bno"));

        System.out.println("id "+id);
        System.out.println("rea "+reason);
        System.out.println("bno "+bno);
        Report report = new Report();
        report.setReporter(id);
        report.setReason(reason);
        report.setBoard_bno(bno);
        boolean result = false;
        int chk1 = boardTeaService.checkReported(report);
        if (chk1 == 0) {
            boardTeaService.reportBoard(report);
            result = true;
        } else {
            result = false;
        }


        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
        System.out.println(json.toString());

    }
}
