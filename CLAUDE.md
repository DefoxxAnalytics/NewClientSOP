# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VSTX is a Static Website Documentation Platform for Versatex Data Analysis team's Standard Operating Procedures (SOPs). It's a single-page application built with vanilla HTML5, CSS3, and JavaScript that provides interactive documentation for vendor spend analysis workflows.

## Technology Stack

- **Frontend:** Vanilla HTML5, CSS3, JavaScript (ES6+)
- **Icons:** Font Awesome 6.0.0 (CDN)
- **Styling:** Modern CSS with custom properties and glassmorphism design
- **Storage:** localStorage for progress tracking
- **Build System:** None (static files)
- **Package Manager:** None required

## Development Commands

### Running Locally
```bash
# Python 3
python -m http.server 8000

# Node.js
npx serve .

# Then open http://localhost:8000
```

### Deployment
```bash
# GitHub Pages (automatic from main branch)
git push origin main

# Manual deployment - copy index.html to web server
```

## Architecture

### Single-File Application
The entire application is contained in `index.html` (1,535 lines) with embedded CSS and JavaScript. This design choice simplifies deployment and ensures all functionality is self-contained.

### Key Sections
- **Navigation:** JavaScript-based section switching without page reloads
- **Search:** Client-side search across all content sections
- **Progress Tracking:** localStorage persistence for checklist items
- **Document Management:** Links to downloadable templates and resources

### Content Structure
1. Overview & Executive Summary
2. Prerequisites & Setup
3. Data Collection & Initial Assessment
4. Quality Assessment
5. Data Cleansing & Standardization
6. Categorization Framework (5-level taxonomy)
7. Dashboard Development (Power BI focus)
8. Delivery & Implementation
9. Quality Management
10. Risk Management
11. Appendices (Templates & Resources)

## Code Organization

### HTML Structure
```html
<!-- Main navigation -->
<nav class="nav-menu">...</nav>

<!-- Content sections -->
<section id="overview" class="content-section">...</section>
<section id="prerequisites" class="content-section">...</section>
<!-- Additional sections... -->

<!-- Embedded styles -->
<style>/* CSS with custom properties */</style>

<!-- Embedded scripts -->
<script>/* JavaScript functionality */</script>
```

### JavaScript Functions
- `showSection(sectionId)` - Handle navigation between sections
- `searchContent()` - Real-time content search
- `toggleItem(itemId)` - Checklist progress tracking
- `updateProgress()` - Progress bar calculations
- `localStorage` management for persistence

### CSS Architecture
- Custom properties for theming
- Glassmorphism effects with backdrop-filter
- Responsive design with media queries
- Animation and transition effects

## Development Guidelines

### When Modifying Content
1. All content changes should be made directly in `index.html`
2. Maintain consistent HTML structure for sections
3. Preserve checklist functionality with proper `onclick` handlers
4. Test search functionality after adding new content

### When Adding Features
1. Keep all JavaScript within the existing `<script>` tag
2. Maintain the single-file architecture
3. Use vanilla JavaScript (no frameworks/libraries)
4. Ensure localStorage compatibility for any persistent data

### Styling Updates
1. Use existing CSS custom properties for consistency
2. Maintain glassmorphism design language
3. Test responsive behavior on mobile devices
4. Preserve accessibility features (ARIA labels, semantic HTML)

## Testing Approach

Since there's no formal testing framework:
1. Manual testing in multiple browsers (Chrome, Firefox, Safari, Edge)
2. Mobile responsiveness testing
3. localStorage functionality verification
4. Search functionality validation
5. Progress tracking persistence checks

## Important Notes

- **No build process:** Changes to index.html are immediately reflected
- **CDN Dependencies:** Font Awesome icons loaded from CDN (requires internet)
- **Browser Compatibility:** Targets modern browsers with ES6+ support
- **Performance:** Single file may be large but eliminates multiple HTTP requests
- **Security:** No backend or API calls, all processing is client-side

## Common Tasks

### Adding a New Section
1. Add navigation item in `<nav class="nav-menu">`
2. Create new `<section>` with unique ID
3. Update search functionality if needed
4. Test navigation and search

### Updating Templates/Resources
1. Update download links in relevant sections
2. Ensure appendices references are current
3. Verify all external links are working

### Customizing for Different Clients
1. Update branding in header section
2. Modify color scheme via CSS custom properties
3. Adjust content to match client requirements
4. Update document templates in appendices references